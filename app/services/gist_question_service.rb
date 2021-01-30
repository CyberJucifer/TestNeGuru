class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.access_token)
  end

  def call
    @client.create_gist(gist_params)
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
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end

end
