class Series
  def initialize(string)
    @numbers = string.chars
  end

  def slices(size)
    raise ArgumentError if size > @numbers.size

    series = []
    for index in 0..@numbers.size
      slice = @numbers.slice(index, size)
      series << slice.join if slice.size.eql?(size)
    end
    series
  end
end
