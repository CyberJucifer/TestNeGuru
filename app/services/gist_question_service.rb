class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.access_token)
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.data.html_url.present?
  end

  private

  def gist_params
    {
      description: I18n.t('test_passages.gist_params.description', title: @test.title),
      files: {
        'test-ne-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [
      @question.title,
      @question.answers.pluck(:title)
    ].join("\n")
  end

end
