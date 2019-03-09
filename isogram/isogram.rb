class Isogram
  def self.isogram?(string)
    @input = string
    chars.eql?(chars.uniq)
  end

  def self.chars
    @input.downcase.scan(/\w/)
  end
end
