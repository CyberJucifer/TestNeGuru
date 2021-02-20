class Category < ApplicationRecord
  default_scope { order(:title) }

  has_many :tests, dependent: :nullify

  validates :title, presence: true

  def self.by_id(id)
    find(id).title
  end

end
