class Integer
  def divisible_by?(number)
    (self % number).zero?
  end
end

class Raindrops
  def self.convert(number)
    output = ''
    output << 'Pling' if number.divisible_by?(3)
    output << 'Plang' if number.divisible_by?(5)
    output << 'Plong' if number.divisible_by?(7)
    output << number.to_s  if output.empty?
    output
  end
end
