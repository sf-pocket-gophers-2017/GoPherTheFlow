class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :username, :email, presence: true, uniqueness: true
  validate :has_password

  def authenticate(new_password)
    self.password == new_password
  end

  private

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def has_password
    if self.password == ""
      errors.add('login error')
    end
  end

end
