require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization, parent_permission: true)
    @specialization = specialization
    super(name, age, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => @age,
      'specialization' => @specialization,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['age'], object['specialization'], object['name'], parent_permission: object['parent_permission'])
  end
end
