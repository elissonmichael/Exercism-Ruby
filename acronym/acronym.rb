class Acronym
  def self.abbreviate(string)
    string.scan(/\b\w/).join.upcase
  end
end
