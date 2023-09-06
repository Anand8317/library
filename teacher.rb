require './person'
require 'json'

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

  def to_json(*_args)
    { age: @age,
      specialization: @specialization,
      name: @name }.to_json
  end

  def self.from_json(json_string)
    age = JSON.parse(json_string)['age']
    specialization = JSON.parse(json_string)['specialization']
    name = JSON.parse(json_string)['name']
    Teacher.new(age, specialization, name)
  end
end
