module ApplicationHelper

  GITHUB_URL = 'https://github.com'.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, project)
    link_to("#{author} - #{project}", "#{GITHUB_URL}/#{author}/#{project}", rel: :nofollow, target: :_blank)
  end

end
