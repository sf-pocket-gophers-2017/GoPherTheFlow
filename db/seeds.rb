User.delete_all
Vote.delete_all
Comment.delete_all
Question.delete_all
Answer.delete_all

20.times do
  User.create(username: Faker::Internet.user_name,
              email: Faker::Internet.safe_email,
              password_hash: "password"
    )
end

20.times do
  Question.create(title: Faker::Lorem.sentences(1),
              description: Faker::Lorem.paragraph,
              user_id: rand(1..20)
    )
end

20.times do
  Vote.create(user_id: rand(1..20),
              voteable_id: rand(1..20),
              voteable_type: ["question", "answer", "comment"].sample
    )
end

20.times do
  Answer.create(description: Faker::Lorem.paragraph,
              question_id: rand(1..20),
              user_id: rand(1..20)
    )
end

20.times do
  Comment.create(description: Faker::HowIMetYourMother.quote,
              user_id: rand(1..20),
              commentable_id: rand(1..20),
              commentable_type: ["question", "answer"].sample
    )
end
