require './person'

class Student < Person
  @id_tem = 0
  attr_reader :classroom
  attr_accessor :type

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
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
