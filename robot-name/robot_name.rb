class RobotNamer
  def random
    String.new.tap do |random_name|
      2.times { random_name << random_letter }
      3.times { random_name << random_digit  }
    end    
  end

  def random_letter
    ('A'..'Z').to_a.shuffle.first  
  end

  def random_digit
    rand(0..9).to_s
  end
end

require 'set'
class Robot
  attr_reader :name, :robot_namer
  @@used_names = Set.new

  def self.forget
    @@used_names.clear
  end

  def initialize(robot_namer: RobotNamer.new)
    @robot_namer = robot_namer
    reset
  end

  def reset
    unique_name = robot_namer.random
    unique_name = robot_namer.random until @@used_names.add? unique_name
    @name       = unique_name
  end
end
