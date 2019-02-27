class Matrix
  attr_reader :rows
  def initialize(string)
    @rows = []
    string.each_line do |line|
      @rows << line.split.map(&:to_i)
    end
  end

  def columns
    @rows.transpose
  end
end
