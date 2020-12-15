class Answer < ApplicationRecord
  # Пока не разобрался, как избежать дублирование данных, пробовал через validates:
  # validates :title, uniqueness: true
  belongs_to :question
end
