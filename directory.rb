def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask what the user wants to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it to a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will exit the program
    else
      puts "Not sure what you mean, try again"
    end
  end
end

interactive_menu
