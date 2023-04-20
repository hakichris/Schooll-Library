class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.entals << self
    person.rentals << self
  end
end
