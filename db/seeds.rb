# Delete any existing seeds from the db
User.delete_all
Vote.delete_all
Comment.delete_all
Question.delete_all
Answer.delete_all

# Create variable to run loop for a vote on comment
commentVote = 5.times do |i|
  v = Vote.create(user_id: u.id,
    voteable_id: c.id,
    voteable_type: Comment
  )
end

# Create 20 users with associated questions, answers, comments, and votes
20.times do
  u = User.create(username: Faker::Internet.user_name,
                  email: Faker::Internet.safe_email,
                  password: "password")

  # Create Questions with associated votes and comments and commentVotes
  5.times do
    q = Question.create(title: Faker::LordOfTheRings.location,
      description: Faker::Lorem.paragraph,
      user_id: u.id,
      )

    5.times do
      c = Comment.create(description: Faker::HowIMetYourMother.quote,
          user_id: u.id,
          commentable_id: q.id,
          commentable_type: Question
      )
      commentVote
    end

    5.times do |i|
      v = Vote.create(user_id: u.id,
        voteable_id: q.id,
        voteable_type: Question
      )
    end
  end

  # Create Answers with associated votes and comments and commentVotes
  5.times do
    a = Answer.create(description: Faker::Lorem.paragraph,
      question_id: q.id,
      user_id: u.id
      )

    5.times do
      c = Comment.create(description: Faker::HowIMetYourMother.quote,
          user_id: u.id,
          commentable_id: a.id,
          commentable_type: Answer
      )
      commentVote
    end

    5.times do |i|
     v = Vote.create(user_id: u.id,
      voteable_id: a.id,
      voteable_type: Answer
      )
    end
  end

end


