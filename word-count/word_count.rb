class Phrase
  attr_reader :input
  def initialize(string)
    @input = string.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    words = Hash.new(0)
    input.each { |word| words[word] += 1 }
    words
  end
end
