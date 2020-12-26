module ApplicationHelper

  GITHUB_URL = 'https://github.com'

  def current_year
    Time.current.year
  end

  def github_url(author, project)
    link_to project_show(author, project), project_url(author, project)
  end

  private

  def project_show(author, project)
    "#{author} #{project}"
  end

  def project_url(author, project)
    "#{GITHUB_URL}/#{author}/#{project}"
  end

end
