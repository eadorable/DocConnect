class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_one :medical_history, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
