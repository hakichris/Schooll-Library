require_relative '../decorators/nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(name = 'unknown', age, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @parent_permission = parent_permission
    @name = name
    @rentals = []
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
