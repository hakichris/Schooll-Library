require_relative '../modules/book_options'
require_relative '../modules/people_options'
require_relative '../modules/rentals_options'
require_relative '../run/storage'

class App
  def initialize(options)
    @options = options
    @book_list = Books.new
    @people_list = People.new
    @rentals_list = Rental.new(@book_options, @people_options)
    @book_list.books = Storage.load_data('Books')
    @people_list.people = Storage.load_data('Person')
    @rentals_list.rentals = Storage.load_data('Rental')
  end

  def select_option(user_choice)
    case user_choice
    when '1'
      @book_list.list_all_books
    when '2'
      @people_list.list_all_people
    when '3'
      @people_list.create_person
      Storage.save_data('Person', @people_list.people)
    when '4'
      @book_list.create_book
      Storage.save_data('Books', @book_list.books)
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
