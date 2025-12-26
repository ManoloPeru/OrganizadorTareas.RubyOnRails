class Participant < ApplicationRecord
  belongs_to :user # Asociación con el modelo User
  belongs_to :task # Asociación con el modelo Task
end
