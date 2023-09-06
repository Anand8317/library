require './person'
require 'json'

class Student < Person
  attr_reader :classroom
  attr_accessor :type

  def initialize(age, classroom, name = 'unknown')
    super(age, name)
    @classroom = classroom
    @type = 'Student'
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    { age: @age,
      classroom: @classroom,
      name: @name }.to_json
  end

  def self.from_json(json_string)
    age = JSON.parse(json_string)['age']
    classroom = JSON.parse(json_string)['classroom']
    name = JSON.parse(json_string)['name']
    Student.new(age, classroom, name)
  end
end
