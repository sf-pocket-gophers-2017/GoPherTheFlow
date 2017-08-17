class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :comments, as: :commentable
  belongs_to :votes, as: :voteable
end
