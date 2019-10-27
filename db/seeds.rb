10.times do |user|
  User.create!(
    name: Faker::Name.name,
    email: "eg-#{user+1}@dic.com",
    password: "password",
    password_confirmation: "password"
  )
end