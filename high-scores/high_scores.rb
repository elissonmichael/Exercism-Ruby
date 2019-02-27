class HighScores
  attr_reader :scores
  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    top_three = @scores.sort
    top_three = top_three.drop(@scores.size - 3) if @scores.size > 3
    top_three.reverse
  end
end
