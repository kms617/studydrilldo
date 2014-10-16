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

  def self.ideal_allocation
    {study: 0.1, drill: 0.25, done: 6.5}
  end

  def ideal_allocation
    allocation = {(study_time: duration * Goal.ideal_allocation[:study]),
                  (drill_time: duration * Goal.ideal_allocation[:drill])
                  (do_time: duration * Goal.ideal_allocation[:do])
                  }
  end

  def actual_allocation(goal)
    alloc = {study: 0, drill: 0, done: 0}

    goal.tasks.each do |task|
      if task.methodology.name == "study"
        study_time += task.duration
      elsif task.methodology.name == "drill"
         drill_time += task.duration
      else
        do_time += task.duration
      end
    end
    allocation = {(study: study_time * Goal.ideal_allocation[:study]),
                  (drill: drill_time * Goal.ideal_allocation[:drill])
                  (done: so_time * Goal.ideal_allocation[:do])
                  }
  end


  def elapsed_time(goal)
    tot_time = 0
    goal.tasks.each do |task|
        tot_time += task.duration
    end
    tot_time
  end

  def study_time_calc(goal)
    study_time = 0
    goal.tasks.each do |task|
      if task.methodology.name == "study"
        study_time += task.duration
      end
    end
    study_time
  end

  def drill_time(goal)
    study_time = 0
    goal.tasks.each do |task|
      if task.methodology.name == "drill"
        drill_time += task.duration
      end
    end
    drill_time
  end

  def do_time(goal)
    do_time = 0
    goal.tasks.each do |task|
      if task.methodology.name == "do"
        do_time += task.duration
      end
    end
    do_time
  end

end
