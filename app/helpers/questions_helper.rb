module QuestionsHelper

  def question_header(question, test)
    question.persisted? ? question_header_edit(question) : question_header_create(test)
  end

  private

  def question_header_create(test)
    I18n.t('.create_new_question', title: test.title)
  end

  def question_header_edit(question)
    I18n.t('.edit_question', title: question.test.title)
  end
end
