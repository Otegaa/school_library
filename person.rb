require_relative './name'

class Person < Nameable
  # constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    # instance variables
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

    # getters
  attr_reader :id
  attr_accessor :age, :name

  # public methods

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # private method

  private

  def of_age?
    @age >= 18
  end

end
