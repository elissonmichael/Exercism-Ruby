class Hamming
  def self.compute(dna1,dna2)
    raise ArgumentError unless dna1.size.eql? dna2.size
    (0..dna1.size).map    { |index| dna1[index].eql? dna2[index] }
                  .select { |bool|  bool.eql? false }
                  .size
  end
end
