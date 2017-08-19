class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true
  has_many :up_votes, -> { where(up_down: 'up-vote') }, class_name: 'Vote', as: :voteable
  has_many :down_votes, -> { where(up_down: 'down-vote') }, class_name: 'Vote', as: :voteable

  def url
    "/comments/#{self.id}"
  end

  def total_votes
    up_votes.count - down_votes.count
  end
end
