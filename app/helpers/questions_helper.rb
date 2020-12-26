module QuestionsHelper

  def question_header
    if @question.persisted?
      question_header_edit
    else
      question_header_create
    end
  end

  private

  def question_header_create
    "Create New #{@test.title} Question"
  end

  def question_header_edit
    "Edit #{@question.test.title} Question"
  end
end
