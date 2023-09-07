require './person'
require 'json'

class Teacher < Person
  attr_accessor :type, :specialization

  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
    @type = 'Teacher'
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ age, specialization, name ]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['a'])
  end
end
