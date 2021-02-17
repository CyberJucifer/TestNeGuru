class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    Badge.select { |badge| send(badge.rule, badge.parameter.to_i) }
  end

  private

  def all_tests_exact_category(category_id)
    return unless @test_passage.success? && @test.category_id == category_id
    @category_id = category_id
    Badge.by_rule("all_tests_exact_category") if all_tests_exact_category_done?
  end

  def first_try(badge)
    return unless @test_passage.success?
    Badge.by_rule('first_try') if @user.tests.where(id: @test.id).count == 1
  end

  def all_tests_exact_level(level)
    return unless @test_passage.success? && @test.level == level
    @level = level
    Badge.by_rule('all_tests_exact_level') if all_tests_exact_level_done?
  end

  def all_tests_exact_level_done?
    TestPassage.passed.joins(:test).where("tests.level": @level).pluck(:test_id).uniq.sort ==
      Test.by_level(@level).pluck(:id).sort
  end

  def all_tests_exact_category_done?
    TestPassage.passed.joins(:test).where("tests.category_id": @category_id).pluck(:test_id).uniq.sort ==
      Test.where(category_id: @category_id).pluck(:id).sort
  end

end