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

  def self.tot_time
    tot_time = 0
    goal.tasks.each do |task|
        tot_time += task.duration
    end
    tot_time
  end

  def self.study_time_calc
    study_time = 0
    goal.tasks.each do |task|
      if task.methodology.name == "study"
        study_time += task.duration
      end
    end
    study_time
  end

  def self.drill_time
    study_time = 0
    goal.tasks.each do |task|
      if task.methodology.name == "drill"
        drill_time += task.duration
      end
    end
    drill_time
  end

  def self.do_time
    do_time = 0
    goal.tasks.each do |task|
      if task.methodology.name == "do"
        do_time += task.duration
      end
    end
    do_time
  end

end
