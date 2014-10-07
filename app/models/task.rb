class Task < ActiveRecord::Base
  belongs_to :goal

  validates :goal_id, presence: true
  validates :methodology_id, presence: true
  validates_inclusion_of :completed, :in => [true, false]
  validates :focus, :duration, presence: true
  validates_numericality_of :duration
  validates :focus, length: { maximum: 100 }
  validates :description, length: { maximum: 255}

end
