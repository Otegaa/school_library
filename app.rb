require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'input'

class App
  attr_accessor :person, :books, :rentals

  def initialize
    @person = []
    @books = []
    @rentals = []
  end

  def create_book
    puts ''
    print 'Enter book title: '
    title = Input.new.user_input
    print 'Enter book author: '
    author = Input.new.user_input
    @books << Book.new(title, author)
    puts 'Success'
  end

  def list_all_books
    puts ''
    @books.each { |book| puts "Title: #{book.title}", "Author: #{book.author}" }
  end

  def create_person
    puts ''
    print 'Enter 1 to add Student and 2 to add Teacher: '
    selection = Input.new.user_input_to_i
    print 'Enter name: '
    name = Input.new.user_input
    print 'Enter age: '
    age = Input.new.user_input_to_i

    case selection
    when 1
      print 'Does student have parent permission [Y/N]: '
      permission = Input.new.user_permission
      student = Student.new(age, 1, permission, name)
      @person << student
    when 2
      print 'What is the teacher\'s specialization: '
      specialization = Input.new.user_input
      teacher = Teacher.new(age, specialization, name)
      @person << teacher
    end

    print 'Success'
  end

  def list_all_people
    puts ''
    @person.each do |person|
      puts ''
      puts "[#{person.class}]"
      puts "Name: #{person.name}"
      puts "ID: #{person.id}"
      puts "Age: #{person.age}"

      if person.instance_of?(Teacher)
        puts "Specialization: #{person.specialization}"
      else
        puts "Permission: #{person.parent_permission}"
      end
    end
  end

  def add_rental
    puts ''
    puts 'Select a book from below by number: '

    @books.each_with_index { |book, index| puts "(#{index}) Title: #{book.title}, Author: #{book.author}" }
    puts ''
    book_num = Input.new.user_input_to_i
    puts ''

    puts 'Select a person from below by number: '
    @person.each_with_index do |person, index|
      puts "(#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
    person_num = Input.new.user_input_to_i
    puts ''

    print 'Date (yyyy/mm/dd): '
    date = Input.new.user_input

    rental = Rental.new(date, @books[book_num], @person[person_num])
    @rentals << rental
    puts ''
    puts 'Success'
  end

  def list_all_rentals
    puts ''
    puts 'All IDs:'
    @rentals.each do |rental|
      puts rental.person.id if rental.person.id
    end
    puts ''

    print 'Please select an ID to show more details: '
    id = Input.new.user_input_to_i
    puts ''

    puts 'Rental(s) for this ID: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'Person does not exist'
      end
    end
  end
end

class OptionHandler
  def initialize(app)
    @app = app
  end

  def handle_option(option)
    actions = {
      1 => AddBookAction.new(@app),
      2 => ListBooksAction.new(@app),
      3 => AddPersonAction.new(@app),
      4 => ListPeopleAction.new(@app),
      5 => AddRentalAction.new(@app),
      6 => ListRentalsAction.new(@app),
      7 => ExitAction.new
    }

    action = actions[option]
    if action
      action.execute
    else
      puts 'Invalid selection'
    end
  end
end

class AddBookAction
  def initialize(app)
    @app = app
  end

  def execute
    @app.create_book
  end
end

class ListBooksAction
  def initialize(app)
    @app = app
  end

  def execute
    @app.list_all_books
  end
end

class AddPersonAction
  def initialize(app)
    @app = app
  end

  def execute
    @app.create_person
  end
end

class ListPeopleAction
  def initialize(app)
    @app = app
  end

  def execute
    @app.list_all_people
  end
end

class AddRentalAction
  def initialize(app)
    @app = app
  end

  def execute
    @app.add_rental
  end
end

class ListRentalsAction
  def initialize(app)
    @app = app
  end

  def execute
    @app.list_all_rentals
  end
end

class ExitAction
  def execute
    exit
  end
end
