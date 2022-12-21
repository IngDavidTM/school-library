class Rental
  attr_reader :book, :person, :date

  def initialize(book, person)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
    @person = person
    person.rentals.push(self) unless book.rentals.include?(self)
    @date = date
  end
end
