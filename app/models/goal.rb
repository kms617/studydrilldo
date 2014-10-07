class Goal < ActiveRecord::Base

  validates :goal, :duration, presence: true
  validates :goal, length: { maximum: 100 }
  validates :objective, length: { maximum: 255}
  validates_numericality_of :duration
  validates_inclusion_of :completed, :in => [true, false]

end
