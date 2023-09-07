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

  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ age, classroom, name ]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
