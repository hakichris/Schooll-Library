class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @parent_permission = parent_permission
    @name = name
  end
  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end
end

class Student < Person
  attr_reader :classroon

  def initialize(_id, age, classroon, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroon = classroon
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(id, name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
