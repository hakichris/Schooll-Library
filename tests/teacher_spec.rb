require_relative './spec_helper'
require 'rspec'
require 'json'

describe Teacher do
  before :each do
    @teacher = Teacher.new(13, 'Solid State', 'Asghari', parent_permission: false)
  end

  context 'When testing a Teacher class' do
    it 'takes four parameters and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'should return the correct field' do
      expect(@teacher.specialization).to eql 'Solid State'
    end
  end

  context 'When using can_use_services? method' do
    it 'should always retuen true' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
