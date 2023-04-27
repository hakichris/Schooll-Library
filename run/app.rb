require_relative '../modules/book_options'
require_relative '../modules/people_options'
require_relative '../modules/rentals_options'
require_relative '../run/storage'

class App
  def initialize(options)
    @options = options
    @book_list = Books.new
    @people_list = People.new
    @rentals_list = Rental.new(@date, @book_list, @people_list)

    @book_list.books = Storage.load_data(Storage::BOOKS_PATH).map do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end

    @people_list.people = Storage.load_data(Storage::PEOPLE_PATH).map do |person_data|
      if person_data['type'] == 'Teacher'
        Teacher.new(person_data['id'], person_data['age'], person_data['name'], person_data['parent_permission'],
                    person_data['specialization'])
      else
        Student.new(person_data['id'], person_data['age'], person_data['name'], person_data['parent_permission'])
      end
    end

    @rentals_list.rentals = Storage.load_data(Storage::RENTALS_PATH).map do |rental_data|
      Rental.new(people.find do |p|
                   p.id == rental_data['person_id']
                 end, books.find do |b|
                        b.id == rental_data['book_id']
                      end, rental_data['date'])
    end

    def select_option(user_choice)
      case user_choice
      when '1'
        @book_list.list_all_books
      when '2'
        @people_list.list_all_people
      when '3'
        @people_list.create_person
        Storage.save_data(Storage::PEOPLE_PATH, @people_list.people.map(&:to_h))
      when '4'
        @book_list.create_book
        Storage.save_data(Storage::BOOKS_PATH, @book_list.books.map(&:to_h))
      when '5'
        @rentals_list.create_rental
        Storage.save_data(Storage::RENTALS_PATH, @rentals_list.rentals.map(&:to_h))
      when '6'
        @rentals_list.list_all_rentals
      else
        puts 'Invalid option, please try again!'
      end
      @options.show_menu
    end
  end
end
