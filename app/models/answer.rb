class Answer < ApplicationRecord
  belongs_to :question
  validates :title, presence: true
  validate :validate_answers_amount, on: :create
  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_amount
    errors.add(:title) if question.answers.count >= 4
  end
end
