require 'json'
module Storage
  BOOKS_PATH = './db/books.json'.freeze
  PEOPLE_PATH = './db/people.json'.freeze
  RENTALS_PATH = './db/rentals.json'.freeze
  def self.load_data(file_path)
    if File.exist?(file_path) && !File.empty?(file_path)
      file = File.read(file_path)
      JSON.parse(file)
    else
      []
    end
  end

  def self.save_data(file_path, data)
    File.write(file_path, JSON.pretty_generate(data))
  end
end
