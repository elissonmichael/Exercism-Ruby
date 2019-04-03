class Bob
  def self.hey(remark)
    remark = Remark.new(remark)
    return "Calm down, I know what I'm doing!" if remark.yelling_question?
    return 'Sure.'                             if remark.question?
    return 'Whoa, chill out!'                  if remark.yell?
    return 'Fine. Be that way!'                if remark.empty?

    'Whatever.'
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
