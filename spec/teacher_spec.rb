require 'spec_helper'
require 'json'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Math', 'John Doe') }

  describe '#initialize' do
    it 'creates a Teacher instance with the specified attributes' do
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the Teacher object' do
      json_data = teacher.to_json
      parsed_json = JSON.parse(json_data)
      expect(parsed_json['a']).to eq([30, 'Math', 'John Doe'])
    end
  end

  describe '.json_create' do
    it 'creates a Teacher instance from a JSON object' do
      json_data = teacher.to_json
      parsed_json = JSON.parse(json_data)
      created_teacher = Teacher.json_create(parsed_json)
      expect(created_teacher.age).to eq(30)
      expect(created_teacher.specialization).to eq('Math')
      expect(created_teacher.name).to eq('John Doe')
    end
  end
end
