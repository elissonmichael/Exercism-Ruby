class InvalidCodonError < ArgumentError
  def initialize(message = 'Please Use a Valid Codon')
    super
  end
end

class Translation
  def self.of_codon(string)
    Codon.new(string).translate
  end

  def self.of_rna(strand)
    new(strand).of_rna
  end

  attr_reader :strand
  def initialize(strand)
    @strand = Strand.new(strand)
  end

  def of_rna
    if proteins.include?('STOP')
      proteins[0..proteins.index('STOP').pred]
    else
      proteins
    end
  end

  def proteins
    strand.codons.map(&:translate)
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
  CODON_PROTEIN = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
                    'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
                    'UUG' => 'Leucine', 'UCU' => 'Serine', 'UCC' => 'Serine',
                    'UCA' => 'Serine',  'UCG' => 'Serine', 'UAU' => 'Tyrosine',
                    'UAC' => 'Tyrosine', 'UGU' => 'Cysteine',
                    'UGC' => 'Cysteine', 'UGG' => 'Tryptophan', 'UAA' => 'STOP',
                    'UAG' => 'STOP', 'UGA' => 'STOP' }.freeze
  attr_reader :input
  def initialize(string)
    @input = string
  end

  def translate
    valid?
    CODON_PROTEIN[input]
  end

  def valid?
    raise InvalidCodonError unless CODON_PROTEIN.key?(input)
  end
end
