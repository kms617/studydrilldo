class Goal < ActiveRecord::Base
  has_many :tasks

  validates :name, presence: true
  validates :duration, presence: true
  validates :name, length: { maximum: 100 }
  validates :objective, length: { maximum: 255}
  validates_numericality_of :duration
  validates_inclusion_of :completed, :in => [true, false]

end
