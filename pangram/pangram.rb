class Pangram
  def self.pangram?(string)
    (('a'..'z').to_a - string.downcase.chars).empty?
  end
end
