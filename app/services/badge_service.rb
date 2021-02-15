class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    Badge.select { |badge| send(badge.rule) }
  end

  private

  def all_tests_data_science
    return unless @test_passage.success?
    Badge.by_rule('all_tests_data_science') if all_tests_data_science_done?
  end

  def first_try
    return unless @test_passage.success?
    @user.tests.where(id: @test.id).count == 1
  end

  def all_tests_1_level
    return unless @test_passage.success?
    Badge.by_rule('all_tests_1_level') if all_tests_1_level_done?
  end

  def all_tests_1_level_done?
    @user.tests.by_level('1') & Test.by_level('1') == Test.by_level('1')
  end

  def all_tests_data_science_done?
    @user.tests.names_by_category('Data Science') & Test.names_by_category('Data Science') == Test.names_by_category('Data Science')
  end

end