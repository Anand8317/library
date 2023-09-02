require './person'

class Teacher < Person
  attr_accessor :type

  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
    @type = 'Teacher'
  end

  def can_use_services?
    true
  end
end
