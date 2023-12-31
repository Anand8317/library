require 'json'

class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @person.rentals << self
    @book = book
    @book.rentals << self
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [date, person, book]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
