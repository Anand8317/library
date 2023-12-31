require 'spec_helper'

describe Person do
  let(:person) { described_class.new(20, 'John Doe', parent_permission: true) }

  describe '#initialize' do
    it 'initializes a Person object' do
      expect(person).to be_an_instance_of(Person)
    end

    it 'sets the name, age, and parent_permission' do
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(20)
      expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    end

    it 'generates a unique id' do
      expect(person.id).not_to be_nil
    end

    it 'initializes an empty rentals array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person has parent permission' do
      underage_person = described_class.new(16, 'Jane Doe', parent_permission: true)
      expect(underage_person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is underage and has no parent permission' do
      underage_person = described_class.new(16, 'Jane Doe', parent_permission: false)
      expect(underage_person.can_use_services?).to eq(false)
    end
  end

  describe '#correct_name method' do
    it 'Returns John Doe as a name of person' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#add_rental method' do
    it 'Returns true if it is an instance of Rental class' do
      expect(person.add_rental('23/03/2023', Book.new('Title', 'Author'))).to be_an_instance_of Rental
    end
  end
end
