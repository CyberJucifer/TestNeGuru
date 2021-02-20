module BadgesHelper

  def badge_header
    @badge.persisted? ? badge_header_edit : badge_header_create
  end

  private

  def badge_header_create
    I18n.t('badge_create')
  end

  def badge_header_edit
    I18n.t('badge_edit')
  end
end
