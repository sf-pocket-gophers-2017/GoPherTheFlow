class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validate :has_password

  def authenticate(new_password)
    self.password == new_password
  end

  private

  def password
    @password ||= BCrypt::Password(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password(new_password)
    self.hashed_password = @password
  end

  def has_password
    if self.password == ""
      errors.add('login error')
    end
  end
end
