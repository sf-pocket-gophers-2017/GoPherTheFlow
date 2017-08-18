class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true
end
