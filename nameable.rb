class Nameable
  def correct_name
    raise NotImplementedError
  end
end

nameable1 = Nameable.new
nameable1.correct_name
