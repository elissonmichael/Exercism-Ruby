class StrandLengthError < ArgumentError
  def initialize(message = 'Strands must be same length')
    super
  end
end

class Hamming
  def self.compute(strand1, strand2)
    raise StrandLengthError unless strand1.size.eql?(strand2.size)
    (0..strand1.size).count { |index| strand1[index] != strand2[index] }
  end
end
