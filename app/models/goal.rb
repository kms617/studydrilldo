class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true
  validates :duration, presence: true
  validates :name, length: { maximum: 100 }
  validates :objective, length: { maximum: 255}
  validates_numericality_of :duration, greater_than: 0
  validates_inclusion_of :completed, in: [true, false]
  validates_inclusion_of :secret, in: [true, false]

  def self.authorized_find(user, id)
    if user.admin?
      find(id)
    else
      where(user: user).find(id)
    end
  end

end
