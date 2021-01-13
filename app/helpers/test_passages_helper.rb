module TestPassagesHelper

  private

  def result_in_percents(test_passage)
    (test_passage.correct_questions.to_f/test_passage.test.questions.count.to_f * 100.0).to_i
  end

end
