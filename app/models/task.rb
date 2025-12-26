# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'  # Asociación con el modelo User como propietario de la tarea
  has_many :participating_users, class_name: 'Participant' # Asociación con el modelo Participant
  has_many :participants, through: :participating_users, source: :user # Usuarios participantes a través de la tabla intermedia Participant

  validates :participating_users, presence: true # Asegura que haya al menos un participante

  validates :name, :description, presence: true
  validates :name, uniqueness: {case_insensitive: false}
  validate :due_date_validity

  accepts_nested_attributes_for :participating_users, allow_destroy: true # Permite atributos anidados para participantes

  def due_date_validity
    return if due_date.blank? # Allow blank due_date to be handled by presence validation elsewhere
    return if due_date >= Date.today # due_date is valid y if it's today or in the future
    
    errors.add :due_date, I18n.t('tasks.errors.invalid_due_date')
  end
end
