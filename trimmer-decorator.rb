require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name_trim = []
    @nameable.correct_name.chars.each do |letter|
      name_trim << letter
    end
    name_trim.join
  end
end
