class StrandLengthError < ArgumentError
  def initialize(message = 'Strands must be same length')
    super
  end
end

class Hamming
  def self.compute(strand1, strand2)
    raise StrandLengthError unless strand1.size.eql?(strand2.size)
    strand1.chars.zip(strand2.chars).count { |char1, char2| char1 != char2 }
  end
end
