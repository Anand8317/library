require_relative 'app'
require_relative 'student'

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
    if choice == 7
      app.save_data
      puts 'Thank you for using our app.'
      break
    else
      app.call(choice)
    end
  end
end

def main
  app = App.new
  menu(app)
end

main
