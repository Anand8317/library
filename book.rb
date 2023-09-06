require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def to_json
    { title: @title, 
      author: @author,
    }.to_json
  end

  def self.from_json(json_string)
    title = JSON.parse(json_string)['title']
    author = JSON.parse(json_string)['author']
    Book.new(title, author)
  end
end
