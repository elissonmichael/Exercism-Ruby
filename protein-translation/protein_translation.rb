class InvalidCodonError < ArgumentError
  def initialize(message = 'Please Use a Valid Codon')
    super
  end
end

class Translation
  def self.of_codon(string)
    Codon.new(string).protein
  end

  def self.of_rna(strand)
    new(strand).of_rna
  end

  attr_reader :strand
  def initialize(strand)
    @strand = Strand.new(strand)
  end

  def of_rna
    strand.codons.map(&:protein).take_while { |protein| protein != 'STOP' }
  end
end

class Strand
  attr_reader :input
  def initialize(string)
    @input = string
  end

  def codons
    input.each_char.each_slice(3).map { |chars| Codon.new(chars.join) }
  end
end

class Codon
  CODON_TO_PROTEIN = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
                       'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
                       'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
                       'UCA' => 'Serine',  'UCG' => 'Serine',
                       'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
                       'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
                       'UGG' => 'Tryptophan', 'UAA' => 'STOP', 'UAG' => 'STOP',
                       'UGA' => 'STOP' }.freeze
  attr_reader :input
  def initialize(string)
    @input = string
  end

  def protein
    validate!
    CODON_TO_PROTEIN[input]
  end

  def validate!
    raise InvalidCodonError unless CODON_TO_PROTEIN.key?(input)
  end
end
