class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_later
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.present?
      current_user.gists.create!(question: @test_passage.current_question, gist_id: result.id, url: result.html_url)
      flash[:notice] = "#{t('.success')} - #{gist_url(result)}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_url(result)
    view_context.link_to('Созданный gist', result.html_url, rel: 'nofollow', target: '_blank')
  end

end
