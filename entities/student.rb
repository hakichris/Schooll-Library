require_relative './person'

class Student < Person
  attr_accessor :classroon

  def initialize(age, classroon, name = 'unknown', parent_permission: true)
    @classroon = classroon
    super(name, age, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
