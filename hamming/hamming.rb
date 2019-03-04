class StrandLengthError < ArgumentError

end

class Hamming
  def self.compute(strand1, strand2)
    unless strand1.size.eql? strand2.size
      raise StrandLengthError, 'Strands must be same length'
    end
    (0..strand1.size).count { |index| strand1[index] != strand2[index] }
  end
end
