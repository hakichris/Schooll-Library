require_relative '../modules/book_options'
require_relative '../modules/people_options'
require_relative '../modules/rentals_options'
require_relative '../run/storage'

class App
  def initialize(options)
    @options = options
    @book_options = Books.new
    @people_options = People.new
    @rentals_list = Rental.new(@date, @book_options, @people_options)
    @book_options.books = Storage.load_data('books')
    @people_options.people = Storage.load_data('Person')
    @rentals_list.rentals = Storage.load_data('Rental')
  end

  def select_option(user_choice)
    case user_choice
    when '1'
      @book_options.list_all_books
    when '2'
      @people_options.list_all_people
    when '3'
      @people_options.create_person
      Storage.save_data('Person', @people_options.people)
    when '4'
      @book_options.create_book
      Storage.save_data('books', @book_options.books)
    when '5'
      @rentals_list.create_rental
      Storage.save_data('Rental', @rentals_list.rentals)
    when '6'
      @rentals_list.list_all_rentals
    else
      puts 'Invalid option, please try again!'
    end
    @options.show_menu
  end
end
