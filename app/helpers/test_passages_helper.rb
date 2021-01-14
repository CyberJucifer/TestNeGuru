module TestPassagesHelper

  def result_in_percents(test_passage)
    (test_passage.correct_questions.to_f/test_passage.test.questions.count * 100).to_i
  end

end
