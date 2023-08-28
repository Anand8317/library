class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = self.class.last_id + 1
    self.class.last_id = @id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    if of_age?
      true
    else
      @parent_permission ? true : false
    end
  end

  class << self
    attr_accessor :last_id
  end

  @last_id = 0

  private

  def of_age?
    @age > 18
  end
end
