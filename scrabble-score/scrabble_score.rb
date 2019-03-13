class Scrabble
  def self.score(input)
    new(input).score
  end

  SCORE = {
    %w[A E I O U L N R S T] => 1,   %w[D G] => 2, %w[B C M P] => 3,
    %w[F H V W Y] => 4, %w[K] => 5, %w[J X] => 8, %w[Q Z] => 10
  }.freeze

  def initialize(input)
    @input = input || ''
  end

  def score
    chars.sum { |char| points(char)}
  end

  private

  def points(letter)
    SCORE.each { |array, value| return value if array.include?(letter) }
    0
  end

  def chars
    @input.upcase.scan(/\w/)
  end
end
