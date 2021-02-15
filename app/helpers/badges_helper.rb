module BadgesHelper

  def badge_header(badge)
    @badge.persisted? ? badge_header_edit(badge) : badge_header_create
  end

  def all_tests_data_science_rule
    Badge::RULES[0]
  end

  def first_try_rule
    Badge::RULES[1]
  end

  def all_tests_1_level_rule
    Badge::RULES[2]
  end

  private

  def badge_header_create
    "Create New Badge"
  end

  def badge_header_edit(badge)
    "Edit #{badge.title} Badge"
  end
end
