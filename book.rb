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

   def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ title, author ]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
