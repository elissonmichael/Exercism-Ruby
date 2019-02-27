class Pangram
  def self.pangram?(string)
    letters = ('a'..'z').to_a
    string.downcase.each_char { |char| letters.delete(char) }
    letters.empty?
  end
end
