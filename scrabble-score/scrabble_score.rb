class ScrabbleChar
  SCORE = {
    %w[A E I O U L N R S T] => 1,   %w[D G] => 2, %w[B C M P] => 3,
    %w[F H V W Y] => 4, %w[K] => 5, %w[J X] => 8, %w[Q Z] => 10
  }.freeze

  def initialize(char)
    @char = char.upcase
  end

  def points
    SCORE.each { |array, value| return value if array.include?(@char) }
    0
  end
end

class Scrabble
  def self.score(input)
    new(input).score
  end

  def initialize(input)
    @input = input
  end

  def score
    return 0 unless @input

    chars.sum(&:points)
  end

  private

  def chars
    @input.scan(/\w/).map { |char| ScrabbleChar.new(char) }
  end
end
