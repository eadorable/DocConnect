class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :medical_histories, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :contact_number, presence: true
  # validates :email, presence: true
  validates :date_of_birth, presence: true
  validates :age, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :gender, presence: true
  validates :marital_status, presence: true
end
