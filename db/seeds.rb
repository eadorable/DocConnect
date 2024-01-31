# db/seeds.rb

# Seed patients
patients = [
  { name: "John Doe", address: "123 Main St", contact_number: "555-1234", email: "john@example.com", date_of_birth: "1990-01-01", gender: "Male", marital_status: "Single", age: 32, weight: 70.5, height: 175.0 },
  { name: "Jane Smith", address: "456 Oak St", contact_number: "555-5678", email: "jane@example.com", date_of_birth: "1985-05-15", gender: "Female", marital_status: "Married", age: 37, weight: 65.0, height: 160.0 },
  { name: "Bob Johnson", address: "789 Pine St", contact_number: "555-9876", email: "bob@example.com", date_of_birth: "1988-08-20", gender: "Male", marital_status: "Single", age: 34, weight: 80.0, height: 180.0 },
  { name: "Alice Brown", address: "101 Elm St", contact_number: "555-4321", email: "alice@example.com", date_of_birth: "1995-02-10", gender: "Female", marital_status: "Divorced", age: 27, weight: 55.0, height: 165.0 },
  { name: "Chris Wilson", address: "202 Cedar St", contact_number: "555-8765", email: "chris@example.com", date_of_birth: "1980-11-25", gender: "Male", marital_status: "Married", age: 41, weight: 75.0, height: 170.0 },
  # Add more patients as needed
]
Patient.create(patients)

# Seed users
users = [
  { email: "admin@example.com", password: "password", name: "Admin User" },
  # Add more users as needed
]
User.create(users)

# Seed medical histories
# patients.each do |patient|
#   medical_histories = Array.new(5) do
#     { patient: patient, history_details: "Medical history details for #{patient[:name]}" }
#   end
#   MedicalHistory.create(medical_histories)
# end

# Seed medical histories

patients.each do |patient_data|
  patient = Patient.create(patient_data)
  medical_histories = Array.new(5) do
    { patient_id: patient.id, history_details: "Medical history details for #{patient.name}" }
  end
  MedicalHistory.create(medical_histories)
end




# Seed appointments
appointments = [
  { date: DateTime.now, patient: Patient.first, user: User.first },
  # Add more appointments as needed
]
Appointment.create(appointments)

puts "Seeding complete!"
