require_relative '../Associations/rental'

class Rental
  attr_accessor :rentals

  def initialize(book_options, people_options)
    @rentals = []
    @books = book_options
    @people = people_options
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.books_list.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title}', Author: #{book.author}"
    end
    book_num = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @people.people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @book.books_list[book_num], @people.people_list[person_num]))
    puts 'Rental created successfully'
  end

  def list_all_rentals
    if rentals_list.empty?
      puts 'No record found! Add a rental...'
    else
      puts "Available rentals in the library: #{rentals_list.count}"
      puts 'Select a person from the following list by id '
      @people.people_list.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      id = gets.chomp.to_i

      puts 'Rentals:'
      @rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
      end
    end
  end
end
