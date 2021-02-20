class Badge < ApplicationRecord

  enum rule: %w[all_tests_exact_category first_try all_tests_exact_level]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :image, presence: true
  validates :rule, presence: true

  scope :by_rule, ->(rule) { where(rule: rule) }

end
