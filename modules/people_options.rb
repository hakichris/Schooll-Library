require_relative '../entities/person'
require_relative '../entities/student'
require_relative '../entities/teacher'

class People
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_all_people
    if @people.empty?
      puts 'No record found! Add a person...'
    else
      puts "Available people in the library: #{people.count}"
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number] '
    person_role = gets.chomp
    case person_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please add a valid input!'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp.to_i
    @people.push(Student.new(age, classroom, name, parent_permission: parent_permission))
    puts "\nPerson created successfuly"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    puts "\nPerson created successfuly"
  end
end
