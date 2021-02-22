module BadgesHelper

  def badge_header(badge)
    badge.persisted? ? badge_header_edit(badge) : badge_header_create
  end

  private

  def badge_header_create
    I18n.t('badge_create')
  end

  def badge_header_edit(badge)
    I18n.t('badge_edit', title: badge.title)
  end
end
