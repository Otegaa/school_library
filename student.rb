require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
