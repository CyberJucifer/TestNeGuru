class Question < ApplicationRecord
  # validates :title, uniqueness: true
  belongs_to :test
  has_many :answers, dependent: :destroy
end
