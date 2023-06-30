class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    # book.rentals << self
  end

  def to_hash
    {
      date: @date,
      book: @book,
      person: @person
    }
  end
end
