require './person'

class Teacher < Person
  @id_tem = 0
  attr_accessor :type

  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(age, name)
    @specialization = specialization
    @type = 'Teacher'
  end

  def can_use_services?
    true
  end
end
