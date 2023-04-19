require_relative './person'

class Student < Person
  attr_reader :classroon

  def initialize(_id, age, classroon, name = 'unknown', parent_permission: true)
    @classroon = classroon
    super(name, age, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
