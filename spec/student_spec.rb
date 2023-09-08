require 'spec_helper'

describe Student do
  context 'Student class check' do
    student = Student.new(25, 'Anand')

    it 'Instance of Student check' do
      expect(student).to be_an_instance_of Student
    end

    it 'Method play_hooky of instance check' do
      expect(student.play_hooky).to eq '¯(ツ)/¯'
    end

    it 'Method add classroom of instance check ' do
      new_classroom = Classroom.new('11th')
      student.classroom = new_classroom
      expect(student.classroom).to be new_classroom
    end
  end
end
