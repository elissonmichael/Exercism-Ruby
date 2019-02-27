class Complement
  def self.of_dna(sequence)
    sequence.tr('CGTA', 'GCAU')
  end
end
