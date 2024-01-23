# db/seeds.rb

# Create doctors
doctor1 = Doctor.create!(
  name: 'Dr. Smith',
  address: '123 Main Street',
  contact_number: '555-1234',
  email: 'dr.smith@example.com',
  specialty: 'Cardiology'
)

doctor2 = Doctor.create!(
  name: 'Dr. Johnson',
  address: '456 Oak Avenue',
  contact_number: '555-5678',
  email: 'dr.johnson@example.com',
  specialty: 'Pediatrics'
)

# Create patients
patient1 = Patient.create!(
  name: 'John Doe',
  address: '789 Elm Street',
  contact_number: '555-9876',
  email: 'john.doe@example.com',
  date_of_birth: Date.new(1980, 1, 1),
  gender: 'Male',
  marital_status: 'Single',
  age: 42
)

patient2 = Patient.create!(
  name: 'Jane Doe',
  address: '101 Pine Avenue',
  contact_number: '555-4321',
  email: 'jane.doe@example.com',
  date_of_birth: Date.new(1985, 5, 15),
  gender: 'Female',
  marital_status: 'Married',
  age: 37
)

# Create medical histories
medical_history1 = MedicalHistory.create!(
  patient: patient1,
  history_details: 'No significant medical history for John Doe.'
)

medical_history2 = MedicalHistory.create!(
  patient: patient2,
  history_details: 'No significant medical history for Jane Doe.'
)

# Create appointments
appointment1 = Appointment.create!(
  doctor: doctor1,
  patient: patient1,
  appointment_date: DateTime.new(2024, 1, 15, 10, 0, 0),
  status: 'Scheduled'
)

appointment2 = Appointment.create!(
  doctor: doctor2,
  patient: patient2,
  appointment_date: DateTime.new(2024, 2, 1, 14, 30, 0),
  status: 'Confirmed'
)

puts 'Seed data has been created successfully!'
