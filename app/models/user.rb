class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_completed_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

end
