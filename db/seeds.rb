User.destroy_all
Student.destroy_all
Team.destroy_all

admin = User.create!(
    email: "admin@admin.com",
    password: "admin",
    first_name: "Big",
    last_name: "Pig",
    image_path: '/images/boss_boar.png',
    role: 'admin'
    )

user1 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user2 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user3 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user4 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user5 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user6 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user7 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user8 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user9 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

user10 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
    )

genders = ["male", "female", "other", "none"]
shirt_sizes = ["x-small", "small", "medium", "large", "x-large"]
grades = ["ninth", "tenth", "eleventh", "twelfth"]
food_allergies = ["none", "peanuts", "gluten", "dairy"]

200.times do
  Student.create!(
    team_id: rand(1..10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: genders.sample,
    grade: grades.sample,
    gpa: rand(0.0..4.0),
    number_of_detentions: rand(0..20),
    shirt_size: shirt_sizes.sample,
    food_allergies: food_allergies.sample
    )
end

team1 = user1.build_team(name: "red")
team1.save
team2 = user2.build_team(name: "orange")
team2.save
team3 = user3.build_team(name: "yellow")
team3.save
team4 = user4.build_team(name: "green")
team4.save
team5 = user5.build_team(name: "blue")
team5.save
team6 = user6.build_team(name: "indigo")
team6.save
team7 = user7.build_team(name: "violet")
team7.save
team8 = user8.build_team(name: "turquoise")
team8.save
team9 = user9.build_team(name: "coral")
team9.save
team10 = user10.build_team(name: "brick")
team10.save
