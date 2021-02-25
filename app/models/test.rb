class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :category_id, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }
  scope :that_have_questions, -> { where(:question.count.positive?)}

  def self.names_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end

end
