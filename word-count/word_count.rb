class Phrase
  def initialize(string)
    @input = string
  end

  def words
    @input.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    words.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end
end
