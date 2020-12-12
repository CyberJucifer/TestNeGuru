class Test < ApplicationRecord
  # validates :title, uniqueness: true
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  def self.names_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
