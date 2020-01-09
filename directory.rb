@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from students.csv"
  puts "5. Clear the current students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "successfully input students"
  when "2"
    show_students
  when "3"
    save_students
    puts "student(s) saved to students.csv"
  when "4"
    load_students
    puts "students loaded"
  when "5"
    clear_file
    puts "file cleared"
  when "9"
    puts "exiting program"
    exit
  else
    puts "Not sure what you mean, try again"
  end
end

def add_name_to_students(a_name, a_cohort = :november)
  @students << {name: a_name, cohort: a_cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit enter twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_name_to_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter the file name where you want it saved"
  filename = STDIN.gets.chomp
  if File.exists?(filename) # if it exists
    file = File.open(filename, "w") do |file|
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
      end
    end
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end # end if
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      add_name_to_students(name, cohort)
    end
  end
end

def clear_file(filename = "students.csv")
  file = File.open(filename, "w") do |file|
    file.truncate(0)
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  filename = "students.csv" if filename.nil? # default to students
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}" if @students.count != 0
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

try_load_students
interactive_menu
