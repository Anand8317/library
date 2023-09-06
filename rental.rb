require 'json'

class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end

  def to_json(*_args)
    { date: @date,
      person: @person,
      book: @book }.to_json
  end

  def self.from_json(json_string)
    date = JSON.parse(json_string)['date']
    person = JSON.parse(json_string)['person']
    book = JSON.parse(json_string)['book']
    Rental.new(date, person, book)
  end
end
