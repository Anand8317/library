require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def call(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def list_books
    if @books.empty?
      puts 'Sorry, No books available.'
    else
      @books.each do |book, index|
        puts "#{index} - Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'Sorry, No people available.'
    else
      @people.each_with_index do |person, index|
        puts "#{index}- [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i
    case type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option. Please enter a valid number: 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    gets.chomp
    print 'Enter classroom: '
    label = gets.chomp

    classroom = Classroom.new(label)
    person = Student.new(age, classroom, name)
    @people.push(person)
    puts "Student '#{name}' created successfully"

    File.write('student.json', JSON.generate(person))
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @people.push(person)
    puts "Teacher '#{name}' created successfully"

    File.write('teacher.json', JSON.generate(person))
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book '#{title}' created successfully"

    File.write('book.json', JSON.generate(book))
  end

  def create_rental
    if @books.empty?
      puts 'Sorry, there is no book in the collection to rent out.'
    elsif @people.empty?
      puts 'Sorry, there is no person in the Database. Add a person first in the database'
    else
      rental_child
    end
  end

  def rental_child
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index} - Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index} [#{person.type}] - Name: #{person.name}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    person = @people[person_id]
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, person, book)
    @rentals.push(rental)
    puts "Rental for '#{book.title}' by '#{person.name}' created successfully"

    File.write('rental.json', JSON.generate(rental))
  end

  def list_rentals
    if @rentals.empty?
      puts 'Sorry, No rentals available.'
    else
      puts 'ID of person: '
      person_id = gets.chomp
      puts 'Rentals: '
      @rentals.each do |rental, _index|
        if person_id == rental.person.id
          puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
  end

  def load_data
    if File.exist?('student.json')
      File.foreach('student.json') do |line|
        s = JSON.parse(line, create_additions: true)
        @people.push(s)
      end
    end

    if File.exist?('teacher.json')
      File.foreach('teacher.json') do |line|
        s = JSON.parse(line, create_additions: true)
        @people.push(s)
      end
    end
    
    return unless File.exist?('book.json')

    File.foreach('book.json') do |line|
      s = JSON.parse(line, create_additions: true)
      @books.push(s)
    end

    return unless File.exist?('rental.json')

    File.foreach('rental.json') do |line|
      s = JSON.parse(line)
      selected_person = ObjectSpace.each_object(Student).select do |obj|
        obj.name == s['a'][1]['a'][2] && obj.age == s['a'][1]['a'][0]
      end
      selected_book = ObjectSpace.each_object(Book).select do |obj|
        obj.title == s['a'][2]['a'][0]
      end
      s1 = Rental.new(s['a'][0], selected_person[0], selected_book[0])
      @rentals.push(s1)
    end
  end

  def save_data
    File.open('student.json', 'w') do |file|
      @people.each do |people|
        if people.type == 'Student'
          file.puts JSON.generate(people)
        end
      end
    end

    File.open('teacher.json', 'w') do |file|
      @people.each do |people|
        if people.type == 'Teacher'
          file.puts JSON.generate(people)
        end
      end
    end

    File.open('book.json', 'w') do |file|
      @books.each do |book|
        file.puts JSON.generate(book) 
      end
    end

    File.open('rental.json', 'w') do |file|
      @rentals.each do |rental|
        file.puts JSON.generate(rental) 
      end
    end
  end
end
