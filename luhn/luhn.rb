module ImprovedInteger
  refine Integer do
    def divisible_by?(number)
      (self % number).zero?
    end
  end
end

class Luhn
  using ImprovedInteger

  def self.valid?(string)
    new(string).valid?
  end

  attr_accessor :input
  def initialize(string)
    @input = string
  end

  def valid?
    return false if input.strip.size < 2 || include_non_digits?

    checksum.divisible_by?(10)
  end

  private

  def checksum
    digits.each_slice(2).sum { |d1, d2 = 0| d1 + double(d2) }
  end

  def double(integer)
    double = integer * 2
    double -= 9 if double > 9
    double
  end

  def include_non_digits?
    input.delete(' ').scan(/\D/).any?
  end

  def digits
    input.scan(/\d/).join.to_i.digits
  end
end
