require 'spec_helper'

describe Classroom do
  let(:classroom) { described_class.new('Room 101') }

  describe '#initialize' do
    it 'initializes a Classroom object' do
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'sets the label' do
      expect(classroom.label).to eq('Room 101')
    end

    it 'initializes an empty students array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      student = instance_double('Student')
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom attribute of the student' do
      student = instance_double('Student')
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
    end
  end
end
