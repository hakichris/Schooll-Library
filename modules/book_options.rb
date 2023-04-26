require_relative '../Associations/book'

class Books
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_all_books
    if @books.empty?
      puts 'No record found! Add some books...'
    else
      puts "Available books in the library: #{books.count}"
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end
end
