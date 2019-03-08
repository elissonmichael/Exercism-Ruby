class Isogram
  def self.isogram?(string)
    @input = string
    char_count.values.reject{ |count| count.equal? 1 }.empty?
  end

  private

  def self.char_count
    chars.each_with_object(Hash.new(0)) { |char, hash| hash[char] += 1 }
  end

  def self.chars
    @input.downcase.scan(/\w/)
  end
end
