require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name: 'Unknown')
    super(age, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(31, 'Manager', name: 'Paco')
puts teacher1.name
puts teacher1.age
puts teacher1.specialization
puts teacher1.can_use_services?
