# db/seeds.rb

# Create sample users
secretary = User.create!(
  name: 'Secretary User',
  email: 'secretary@example.com',
  password: 'password',
  role: :secretary
)

doctor = User.create!(
  name: 'Doctor User',
  email: 'doctor@example.com',
  password: 'password',
  role: :doctor
)

# Create sample patients
patient1 = Patient.create!(name: 'John Doe')
patient2 = Patient.create!(name: 'Jane Doe')

# Create sample medical histories for patients
MedicalHistory.create!(patient: patient1, history_details: 'Sample medical history for John Doe')
MedicalHistory.create!(patient: patient2, history_details: 'Sample medical history for Jane Doe')

# Create sample appointments
Appointment.create!(
  appointment_date: Time.now + 1.day,
  status: 'Scheduled',
  secretary: secretary,
  doctor: doctor,
  patient: patient1
)

Appointment.create!(
  appointment_date: Time.now + 2.days,
  status: 'Scheduled',
  secretary: secretary,
  doctor: doctor,
  patient: patient2
)

puts 'Seed data has been created.'
