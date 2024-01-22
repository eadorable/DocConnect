# class User < ApplicationRecord
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable
# end
class User < ApplicationRecord
  enum role: [:secretary, :doctor]

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Additional fields
  validates :name, presence: true

  has_many :appointments, foreign_key: 'secretary_id', class_name: 'Appointment', dependent: :destroy
  has_many :patient_appointments, foreign_key: 'doctor_id', class_name: 'Appointment'
  has_many :patients, through: :patient_appointments, source: :patient

  has_many :medical_histories, through: :patients
end
