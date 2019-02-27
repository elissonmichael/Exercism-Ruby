class Matrix
  attr_reader :rows
  def initialize(string)
    @rows = string.each_line.map do |line|
      line.split.map(&:to_i)
    end
  end

  def columns
    @rows.transpose
  end
end
