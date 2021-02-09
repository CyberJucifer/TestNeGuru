class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil? || timed_out?
  end

  def success?
    result_in_percents >= 85
  end

  def accept!(answer_ids)
    unless answer_ids.nil?
      self.correct_questions += 1 if correct_answer?(answer_ids)
      self.completed_questions += 1
      save!
    end
  end

  def result_in_percents
    (correct_questions.to_f/test.questions.count * 100).to_i
  end

  def timed_out?
    (test.timer * 60 - (Time.now - created_at)).to_i <= 0 if test.timer.present?
  end

  def time_left
    (test.timer * 60 - (Time.now - created_at)).to_i if test.timer > 0
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

end
