
users = [
  { email: "doctor@docconnect.com", password: "doctor123", name: "DocConnect", role: "admin" },
  { email: "user@docconnect.com", password: "user123", name: "DocConnect", role: "user" },
  { email: "superadmin@docconnect.com", password: "superadmin123", name: "SuperAdmin", role: "superadmin" }
]

users.each do |user_data|
  User.create(user_data)
end

puts "Seeding complete!"
