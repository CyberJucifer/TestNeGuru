class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates_uniqueness_of :title, scope: :level

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }
  scope :names_by_category, lambda { |category|
    order(title: :desc)
      .joins(:category)
      .where(categories: { title: category })
  }

  def self.test_names_by_category(category)
    names_by_category(category).pluck(:title)
  end

end
