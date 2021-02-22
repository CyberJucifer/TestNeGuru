class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.completed?
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      current_user.badges << BadgeService.new(@test_passage).give_badges
      TestsMailer.completed_test(@test_passage).deliver_later
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GithubService.new(@test_passage.current_question).call

    gist = current_user.gists.create(question: @test_passage.current_question, gist_id: result.id, url: result.html_url)

    if result && gist.persisted?
      flash[:notice] = "#{t('.success')} - #{view_context.link_to(t('.created_gist'),
                                                                  result.html_url,
                                                                  rel: 'nofollow',
                                                                  target: '_blank')}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
