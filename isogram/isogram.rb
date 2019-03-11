class Isogram
  def self.isogram?(string)
    chars = string.downcase.scan(/\w/)
    chars.eql?(chars.uniq)
  end
end
