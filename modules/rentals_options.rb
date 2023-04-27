require_relative '../Associations/rental'

class Rental
  attr_accessor :rentals

  def initialize(book_options, people_options)
    @rentals = []
    @book = book_options
    @people = people_options
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @book.books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_id = gets.chomp.to_i
    book = @book.books.find { |b| b.id == book_id }
    puts 'Select a person from the following list by number (not id)'
    @people.people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    person = @people.people.find { |p| p.id == person_id }
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, book, person))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    if rentals.empty?
      puts 'No record found! Add a rental...'
    else
      puts "Available rentals in the library: #{rentals.count}"
      puts 'Select a person from the following list by id '
      @people.people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      id = gets.chomp.to_i
      rentals = @rentals.filter { |rental| rental.person.id == id }

      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      end
    end
  end
end
