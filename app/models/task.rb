class Task < ActiveRecord::Base
  belongs_to :goal
  belongs_to :methodology

  validates :goal, presence: true
  validates :methodology, presence: true
  validates_inclusion_of :completed, :in => [true, false]
  validates :focus, presence: true
  validates :duration, presence: true
  validates_numericality_of :duration, greater_than: 0
  validates :focus, length: { maximum: 100 }
  validates :description, length: { maximum: 255 }
  validate :action_or_url

  def action_or_url
    if action.blank? && action_url.blank?
      errors[:base] << "Please enter either an action or a url."
    end
  end
end
