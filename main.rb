require_relative 'app'

def menu(app)
  loop do
    puts ' '
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    print ''

    choice = gets.chomp.to_i

    case choice
    when 1..6 then options(app, choice)
    when 7 then puts 'Thank you for using our app.'
    end
    break if choice == 7
  end
end

def options(app, choice)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  end
end

def main
  app = App.new
  menu(app)
end

main
