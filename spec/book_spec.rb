require 'spec_helper'
require 'date'

describe Book do
  let(:book) { described_class.new('The Great Gatsby', 'F. Scott Fitzgerald') }

  describe '#initialize' do
    it 'initializes a Book object' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'sets the title and author' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'initializes an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new rental with the book as the item' do
      # Create a test double for Person that responds to rentals
      person = instance_double('Person', rentals: [])

      date = Date.today
      rental = book.add_rental(date, person)

      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
    end
  end

  describe 'JSON serialization' do
    it 'serializes to JSON' do
      json = book.to_json
      expect(json).to be_a(String)
      expect { JSON.parse(json) }.not_to raise_error
    end

    it 'deserializes from JSON' do
      json = book.to_json
      new_object = JSON.parse(json)
      expect(new_object).to be_a(Hash)
      expect(new_object['json_class']).to eq('Book')
      expect(new_object['a']).to eq([book.title, book.author])
    end
  end
end
