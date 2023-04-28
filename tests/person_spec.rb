require_relative './spec_helper'
require 'rspec'

describe Person do
  before :each do
    @person = Person.new(23, 'chris', parent_permission: true)
    @unknown = Person.new(10)
  end
  context 'When testing the person class' do
    it 'when initiated with data it returns an instance of the person' do
      expect(@person).to be_an_instance_of Person
    end
  end

  context 'when checkng the correct name' do
    it 'it returns the name of a person' do
      expect(@person.correct_name).to eq 'chris'
    end
  end

  context 'when checking is a person can use service' do
    it 'it returns true if the person is of_age and parent_permission is true' do
      expect(@person.can_use_services?).to be true
    end
  end

  context 'When using correct_name method' do
    it 'should return the correct name' do
      expect(@unknown.correct_name).to eql 'unknown'
    end
  end
end
