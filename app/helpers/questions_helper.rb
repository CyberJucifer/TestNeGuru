module QuestionsHelper

  def question_header(question, test)
    question.persisted? ? question_header_edit(question) : question_header_create(test)
  end

  private

  def question_header_create(test)
    "Create New #{test.title} Question"
  end

  def question_header_edit(question)
    "Edit #{question.test.title} Question"
  end
end
