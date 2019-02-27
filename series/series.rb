class Series
  def initialize(string)
    @numbers = string.chars
  end

  def slices(size)
    raise ArgumentError if size > @numbers.size

    @numbers.each_cons(size).map(&:join)
  end
end
