class User < ActiveRecord::Base
  validates :username, presence: true
  validate :email_valid
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_valid
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors[:base] << "Please enter a valid email."
    end
  end
end
