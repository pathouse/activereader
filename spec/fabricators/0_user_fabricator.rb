Fabricator(:user) do
  email { Faker::Internet.email }
  password   { Faker::Lorem.characters(8) }
end