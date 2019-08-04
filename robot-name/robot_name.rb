require 'set'
class Robot
  attr_reader :name
  @@used_names = Set.new

  def self.forget
    @@used_names.clear
  end
 
  def initialize
    reset
  end

  def reset
    unique_name = generate_random_name
    unique_name = generate_random_name until @@used_names.add? unique_name
    @name       = unique_name
  end

  private

  def generate_random_name
    random_name = ''
    2.times { random_name << random_letter }
    3.times { random_name << random_digit  }
    random_name    
  end

  def random_letter
    ('A'..'Z').to_a.shuffle.first  
  end

  def random_digit
    rand(0..9).to_s
  end
end
