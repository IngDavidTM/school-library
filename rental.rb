class Rental
  attr_reader :book

  def initialize(book)
    @book = book
    book.rentals.push(self) unless book.rentals.include?(self)
  end
end
