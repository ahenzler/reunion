class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost/@participants.count
  end

  def owed
    owed = {}
    @participants.each do |key, value|
      owed[key] = split - value
    end
    owed
  end
end