class Appointment < ApplicationRecord
  belongs_to :secretary, class_name: 'User', foreign_key: 'secretary_id'
  belongs_to :doctor, class_name: 'User', foreign_key: 'doctor_id'
  belongs_to :patient
end
