class User < ActiveRecord::Base
  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :username, presence: true
  validate :email_valid

  # Other available devise modules :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def email_valid
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors[:base] << "Please enter a valid email."
    end
  end

  def admin?
    role == 'admin'
  end

  def is_admin?
    role == 'admin'
  end

  mount_uploader :profile_photo, ProfilePhotoUploader
end
