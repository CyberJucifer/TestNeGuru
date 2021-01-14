class Answer < ApplicationRecord
  belongs_to :question

  before_validation :find_question, only: %i[create]

  validates :title, presence: true
  validate :validate_answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_amount
    errors.add(:title) if question.answers.count >= 4
  end

  def find_question

  end

end
