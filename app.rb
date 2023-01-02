require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative './functionalities/options'
require_relative './functionalities/list_books'

ACTIONS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals,
  7 => :break
}.freeze

class App
  def initialize
    puts 'Welcome to School Library App!'
    @books = []
    @people = []
    @rentals = []
  end

  def select
    loop do
      Options.display
      option = gets.chomp.to_i
      action = ACTIONS[option]

      if action == :break
        puts 'Thank you for using this app!'
        break
      elsif action
        send(action)
      else
        puts 'Error: Invalid number, try again'
      end
    end
  end

  def list_books
    ListBooks.list(@books)
  end

  def list_people
    @people.each do |object|
      puts "[#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option_person = gets.chomp.to_i
    case option_person
    when 1
      print 'Age: '
      person_age = gets.chomp.to_i
      print 'Name: '
      person_name = gets.chomp.to_s
      print 'Has parent permission? [Y/N]: '
      person_permission = gets.chomp.to_s
      if person_permission.capitalize == 'N'
        @people.push(Student.new(person_age, name: person_name, parent_permission: false))
      else
        @people.push(Student.new(person_age, name: person_name))
      end
      puts 'Person created successfully'
    when 2
      print 'Age: '
      person_age = gets.chomp.to_i
      print 'Name: '
      person_name = gets.chomp.to_s
      print 'Specialization: '
      person_specialization = gets.chomp.to_s
      @people.push(Teacher.new(person_age, person_specialization, name: person_name))
      puts 'Person created successfully'
    else
      puts 'Error: Invalid number, try again'
      send(:create_person)
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp.to_s
    print 'Author: '
    book_author = gets.chomp.to_s
    @books.push(Book.new(book_title, book_author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |object, index|
      puts "#{index}) Title: '#{object.title}', Author: #{object.author}"
    end
    book_number = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |object, index|
      puts "#{index}) [#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp.to_s
    @rentals.push(Rental.new(@books[book_number], @people[person_number], date))
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |object|
      puts "Date: #{object.date}, Book '#{object.book.title}' by #{object.book.author}" if object.person.id == person_id
    end
  end
end
