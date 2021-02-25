class TestsController < ApplicationController

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.joins(:questions).uniq
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def rescue_with_test_not_found
    render plain: t('.test_not_found')
  end

end
