require './person'

class Student < Person
  @id_tem = 0
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
end
