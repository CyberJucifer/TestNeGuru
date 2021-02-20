module ApplicationHelper

  GITHUB_URL = 'https://github.com'.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, project)
    link_to("#{author} - #{project}", "#{GITHUB_URL}/#{author}/#{project}", rel: :nofollow, target: :_blank)
  end

  def flash_message(type)
    if flash[type]
      type == 'alert' ? flash_type = 'alert-danger' : flash_type = 'alert-info'
      content_tag :p, flash[type].html_safe, class: "flash #{flash_type}"
    end
  end

  def show_rule(badge)
    I18n.t(".#{badge.rule}", title: (badge.all_tests_exact_category? ? Category.by_id(badge.parameter) : badge.parameter) )
  end

end
