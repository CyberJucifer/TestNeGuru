class User < ApplicationRecord
  # validates :nickname, uniqueness: true
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id

  def tests_completed_by_level(test_level)
    tests.where(level: test_level)
  end
end
