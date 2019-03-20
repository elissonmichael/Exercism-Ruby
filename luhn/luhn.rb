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

  attr_reader :input
  def initialize(string)
    @input = string
  end

  def valid?
    return false if input.strip.size < 2 || include_non_digits?

    checksum.divisible_by?(10)
  end

  private

  def checksum
    digits.each_slice(2).map { |d1, d2| [d1, double(d2)] }.flatten.sum
  end

  def double(integer)
    return 0 unless integer

    double = integer * 2
    double -= 9 if double > 9
    double
  end

  def include_non_digits?
    !input.delete(' ').scan(/\D/).empty?
  end

  def digits
    input.scan(/\d/).join.to_i.digits
  end
end
