# Seed users
users = [
  { email: "admin@docconnect.com", password: "admin123", name: "DocConnect", role: "admin" },
  { email: "user@docconnect.com", password: "user123", name: "DocConnect", role: "user" }
]

users.each do |user_data|
  User.create(user_data)
end

puts "Seeding complete!"
