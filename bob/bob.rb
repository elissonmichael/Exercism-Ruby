class Bob
  def self.hey(remark)
    case Remark.new(remark)
    when :yelling_question?.to_proc then "Calm down, I know what I'm doing!"
    when :question?.to_proc         then 'Sure.'
    when :yell?.to_proc             then 'Whoa, chill out!'
    when :empty?.to_proc            then 'Fine. Be that way!'
    else 'Whatever.'
    end
  end
end

class Remark
  def initialize(string)
    @input = string
  end

  def input
    @input.strip
  end

  def any_letter?
    input.scan(/[a-zA-Z]/).any?
  end

  def yell?
    any_letter? && input.eql?(input.upcase)
  end

  def question?
    input.chars.last.eql?('?')
  end

  def empty?
    input.empty?
  end

  def yelling_question?
    yell? && question?
  end
end
