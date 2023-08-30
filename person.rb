class Person
  attr_accessor :name, :age
  attr_reader :id

  @id_tem = 0

  class << self
    attr_accessor :id_tem
  end

  def initialize(age, name = 'unknown', parent_permission: true)
    self.class.id_tem += 1
    @id = self.class.id_tem
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age > 18
  end
end
