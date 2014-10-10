class Methodology < ActiveRecord::Base
  has_many :tasks
  validates :name, presence: true

  def self.types
    ['study', 'drill', 'do']
  end

  # validates_inclusion_of :name, in: Methodology.types

end
