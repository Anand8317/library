# require 'spec_helper'

# describe Rental do
#   let(:date) { Date.today }
#   let(:person) { instance_double('Person') }
#   let(:book) { instance_double('Book') }

#   subject(:rental) { described_class.new(date, person, book) }

#   describe '#initialize' do
#     it 'sets date, person, and book' do
#       expect(rental.date).to eq(date)
#       expect(rental.person).to eq(person)
#       expect(rental.book).to eq(book)
#     end

#     it 'adds the rental to the person' do
#       expect(person).to receive(:add_rental).with(rental)
#       rental
#     end

#     it 'adds the rental to the book' do
#       expect(book).to receive(:add_rental).with(rental)
#       rental
#     end
#   end

#   describe '#to_json' do
#     it 'returns a valid JSON representation' do
#       json = rental.to_json
#       parsed = JSON.parse(json)
#       expect(parsed).to be_a(Hash)
#       expect(parsed).to have_key(JSON.create_id)
#       expect(parsed[JSON.create_id]).to eq('Rental')
#       expect(parsed).to have_key('a')
#       expect(parsed['a']).to be_a(Array)
#       expect(parsed['a']).to eq([date, person, book])
#     end
#   end

#   describe '.json_create' do
#     it 'creates a Rental object from JSON data' do
#       json_data = {
#         JSON.create_id => 'Rental',
#         'a' => [date, person, book]
#       }.to_json

#       rental = described_class.json_create(JSON.parse(json_data))
#       expect(rental).to be_a(described_class)
#       expect(rental.date).to eq(date)
#       expect(rental.person).to eq(person)
#       expect(rental.book).to eq(book)
#     end
#   end
# end
