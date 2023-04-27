class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.rentals << self
    person.rentals << self
  end

  def to_h
    {
      book_id: @book.id,
      person_id: @person.id,
      date: @date.to_s
    }
  end
end
