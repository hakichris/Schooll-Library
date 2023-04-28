require 'rspec'
require 'json'
require_relative './spec_helper'

describe Student do 
    before :each do 
        @student = Student.new(23, 'chris', parent_permission = true)
        @classroom = Classroom.new('Masters')
    end 

    context 'When testing a Student class' do
          it 'takes four parameters and returns a Student object' do
            expect(@student).to be_an_instance_of Student
          end
        end
      
        context 'When using play_hooky method' do
          it 'should return a string ¯¯\\(ツ)/¯' do
            expect(@student.play_hooky).to eql '¯\\(ツ)/¯'
          end
        end
      
        context 'When using classroom method' do
          it 'should assign student to a classroom' do
            @student.classroom = @classroom
            expect(@student.classroom).to eql @classroom
          end
        end
      
        context 'Create an object from JSON' do
          it 'should check json string' do
            @student = JSON.parse(
              '{"json_class":"Student","age":23,"classroom":"Masters","name":"chris","parent_permission":true}',
              create_additions: true
            )
            expect(@student).to be_an_instance_of Student
          end
        end

end 