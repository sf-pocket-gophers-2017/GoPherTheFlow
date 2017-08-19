class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :up_votes, -> { where(up_down: 'up-vote') }, class_name: 'Vote', as: :voteable
  has_many :down_votes, -> { where(up_down: 'down-vote') }, class_name: 'Vote', as: :voteable

  def url
    "/questions/#{self.id}"
  end

  def total_votes
    up_votes.count - down_votes.count
  end
end
