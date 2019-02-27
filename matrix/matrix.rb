class Matrix
  attr_reader :rows
  def initialize(string)
    @rows = []
    string.split("\n").each do |line|
      @rows << line.split.map(&:to_i)
    end
  end

  def columns
    @columns ||= transpose
  end

  private

  def transpose
    @columns = []
    rows.size.times do |i|
      @columns << []
      rows.size.times { |j| @columns[i] << rows[j][i] }
    end
    @columns
  end
end
