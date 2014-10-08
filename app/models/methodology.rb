class Methodology < ActiveRecord::Base
  has_many :tasks
  validates :name, presence: true

  def self.types
    ['study', 'drill', 'do']
  end
end
