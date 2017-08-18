User.delete_all
Vote.delete_all
Comment.delete_all
Question.delete_all
Answer.delete_all

20.times do
  u = User.create(username: Faker::Internet.user_name,
                  email: Faker::Internet.safe_email,
                  password: "password")
  5.times do
    q = Question.create(title: Faker::LordOfTheRings.location,
      description: Faker::Lorem.paragraph,
      user_id: u.id,
      )
  end
  5.times do
    a = Answer.create(description: Faker::Lorem.paragraph,
      question_id: q.id,
      user_id: u.id
    )
  end
  5.times do
    c = Comment.create(description: Faker::HowIMetYourMother.quote,
        user_id: u.id,
        commentable_id: a.id,
        commentable_type: Answer
  )
  end
  5.times do
    c = Comment.create(description: Faker::HowIMetYourMother.quote,
        user_id: u.id,
        commentable_id: q.id,
        commentable_type: Question
  )
  end
  5.times do |i|
    v = Vote.create(user_id: u.id,
      voteable_id: q.id,
      voteable_type: Question
  )
  end
  5.times do |i|
   v = Vote.create(user_id: u.id,
    voteable_id: a.id,
    voteable_type: Answer
  )
  end
  5.times do |i|
    v = Vote.create(user_id: u.id,
      voteable_id: c.id,
      voteable_type: Comment
  )
  end

end
