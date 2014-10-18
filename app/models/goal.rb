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
    {study: 0.1, drill: 0.25, do: 0.65}
  end

  def ideal_allocation
    allocation = {study: ((duration * Goal.ideal_allocation[:study]).to_i),
                  drill: ((duration * Goal.ideal_allocation[:drill]).to_i),
                  do: ((duration * Goal.ideal_allocation[:do]).to_i)
                  }
  end

  def actual_allocation
    alloc = {study: 0, drill: 0, do: 0}

    tasks.each do |task|
      if task.methodology.name == "study"
        alloc[:study] += task.duration
      elsif task.methodology.name == "drill"
         alloc[:drill] += task.duration
      else
        alloc[:do] += task.duration
      end
    end
    alloc
  end

  def actual_array
    actual_array = []
    self.actual_allocation.each do |k, v|
      actual_array << [k.to_s, v]
    end
    actual_array
  end

  def ideal_array
    ideal_array = []
    self.ideal_allocation.each do |k, v|
      ideal_array << [k.to_s, v]
    end
    ideal_array
  end

  def ongoing_array
    ongoing_array = []
    elapsed_time = 0
    self.actual_allocation.each do |k, v|
      ongoing_array << [k.to_s, v]
      elapsed_time += v
    end
    t_remaining = (duration  - elapsed_time)
    ongoing_array << ["time remaining", t_remaining]
    ongoing_array
  end

  def elapsed_time
    tot_time = 0
    goal.tasks.each do |task|
        tot_time += task.duration
    end
    tot_time
  end

  def advice_calc(ideal, actual)
    advice = []

    ideal.each do |k, v|
      if v > actual[k]
        advice << "Not enough #{k}ing"
      elsif v < actual[k]
        advice << "Too much #{k}ing"
      else
        advice << "Just right."
      end
    end
    advice
  end

  def ontrack?(ideal, actual)
    ontrack = []
    actual.each do |k, v|
      if v == 0
        ontrack << "<div id=\"noneyet\">None Yet</div>".html_safe
      elsif v == ideal[k]
        ontrack << "<div id=\"ontrack\">On Track</div>".html_safe
      else
        ontrack << "<div id=\"offtrack\">Off Track</div>".html_safe
      end
    end
    ontrack
  end

  def editable_by?(user)
    self == user || user.admin?
  end
end
