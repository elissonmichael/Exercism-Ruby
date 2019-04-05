class InvalidCodonError < ArgumentError
  def initialize(message = 'Please Use a Valid Codon')
    super
  end
end

class Translation
  CODON_PROTEIN = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
                    'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
                    'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
                    'UCA' => 'Serine',  'UCG' => 'Serine', 'UAU' => 'Tyrosine',
                    'UAC' => 'Tyrosine', 'UGU' => 'Cysteine',
                    'UGC' => 'Cysteine', 'UGG' => 'Tryptophan', 'UAA' => 'STOP',
                    'UAG' => 'STOP', 'UGA' => 'STOP' }.freeze

  def self.of_codon(codon)
    CODON_PROTEIN[codon]
  end

  def self.of_rna(strand)
    new(strand).of_rna
  end

  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  def of_rna
    individual_codons.each_with_object([]) do |codon, array|
      raise InvalidCodonError unless CODON_PROTEIN.key?(codon)
      return array if stop(codon)

      array << CODON_PROTEIN[codon]
    end
  end

  private

  def stop(codon)
    CODON_PROTEIN[codon].eql?('STOP')
  end

  def individual_codons
    strand.chars.each_slice(3).map(&:join)
  end
end
