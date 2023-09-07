require 'spec_helper'
require 'date'

describe Rental do
  let(:person) { Person.new(25, 'John Doe', parent_permission: true) }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:date) { Date.today }

  describe '#initialize' do
    it 'initializes a Rental object' do
      rental = described_class.new(date, person, book)
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'sets the date, person, and book' do
      rental = described_class.new(date, person, book)
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the person' do
      rental = described_class.new(date, person, book)
      expect(person.rentals).to include(rental)
    end

    it 'adds the rental to the book' do
      rental = described_class.new(date, person, book)
      expect(book.rentals).to include(rental)
    end
  end

  describe 'JSON serialization' do
    it 'serializes to JSON' do
      rental = described_class.new(date, person, book)
      json = rental.to_json
      expect(json).to be_a(String)
      expect { JSON.parse(json) }.not_to raise_error
    end
  end
end
