class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id
  validates :nickname, presence: true

  def tests_completed_by_level(level)
    tests.by_level(level)
  end
end
