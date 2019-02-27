class Complement
  CONVERSION = { 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U' }
  def self.of_dna(sequence)
    sequence.chars.map { |char| CONVERSION[char] }.join
  end
end
