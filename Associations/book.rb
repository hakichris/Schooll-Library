class Book
  attr_reader :rentals, :id
  attr_accessor :title, :author

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['title'], object['author'])
  end
end
