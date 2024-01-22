class User < ApplicationRecord
  enum role: [:secretary, :doctor]

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Additional fields
  validates :name, presence: true

  # has_many :appointments_as_secretary, foreign_key: 'secretary_id', class_name: 'Appointment', dependent: :destroy
  # has_many :appointments_as_doctor, foreign_key: 'doctor_id', class_name: 'Appointment', dependent: :destroy
  # has_many :patients, through: :appointments_as_doctor, source: :patient
  has_many :patients, through: :appointments

  # has_many :medical_histories, through: :patients
end
