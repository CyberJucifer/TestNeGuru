class Badge < ApplicationRecord

  RULES = %w[all_tests_exact_category first_try all_tests_exact_level].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :image, presence: true
  validates :rule, presence: true

  scope :by_rule, ->(rule) { where(rule: rule) }

  def category_title(id)
      Category.find(id).title
  end

  def all_tests_exact_category_rule?
    rule == 'all_tests_exact_category'
  end

end
