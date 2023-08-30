require './person'

class Student < Person
  @id_tem = 0

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
