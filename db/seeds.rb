require 'faker'

100.times do |u|
  User.create!(:name => Faker::Name.name,
               :email => Faker::Internet.email,
               :password => rand(10000))
end

