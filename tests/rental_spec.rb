require_relative './spec_helper'
require 'rspec'
require 'json'

describe Rental do
  describe '>> new Rental' do
    it '>> Create a new object' do
      # Arrange
      @book = Book.new('Title', 'Author')
      @person = Student.new('25', 'ruby-101', 'Mohi', parent_permission: true)
      @rental = Rental.new('2020/12/12', @book, @person)

      # Assert
      expect(@rental).to be_an_instance_of Rental
    end
  end
end
