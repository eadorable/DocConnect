class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :user # doctor

  validates :date, presence: true
  validates :patient_id, presence: true

end
