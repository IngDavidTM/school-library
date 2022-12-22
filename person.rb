require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rental
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def generate_id
    @id = Random.rand(1..1000)
  end

  def of_age?
    @age >= 18
  end

  def add_rental(rental)
    @rentals << rental
    rental.person = self
  end
end
