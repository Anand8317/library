require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  @id_tem = 0

  class << self
    attr_accessor :id_tem
  end

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    self.class.id_tem += 1
    @id = self.class.id_tem
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
