class Luhn
  def self.valid?(string)
    new(string).valid?
  end

  attr_reader :input
  def initialize(string)
    @input = string
  end

  def valid?
    return false if input.strip.size < 2 || include_non_digits?

    digits.map
          .with_index { |number, index| index.odd? ? number.double : number }
          .sum.divisible_by?(10)
  end

  private

  def include_non_digits?
    !input.delete(' ').scan(/\D/).empty?
  end

  def digits
    input.scan(/\d/).join.to_i.digits
  end
end

class Integer
  def double
    double = self * 2
    double -= 9 if double > 9
    double
  end

  def divisible_by?(number)
    (self % number).zero?
  end
end
