class Year
  def self.leap?(year)
    new(year).leap?
  end

  attr_reader :year
  def initialize(year)
    @year = year
  end

  def leap?
    leap_century? or not century? and quad_year?
  end

  def leap_century?
    (year % 400).zero?
  end

  def century?
    (year % 100).zero?
  end

  def quad_year?
    (year % 4).zero?
  end
end
