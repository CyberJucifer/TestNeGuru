class Category < ApplicationRecord
  # validates :title, uniqueness: true
  has_many :tests, dependent: :nullify
end
