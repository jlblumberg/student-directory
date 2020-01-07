def input_students
  puts "Please enter the names and cohorts of the students"
  puts "To finish, just hit enter twice"
  students = []
  cohorts = []
  puts "Enter the name"
  name = gets.chomp.capitalize
  while !name.empty? do
    puts "And the cohort"
    cohort = gets.chomp.capitalize
    cohort = :defualt if cohort.empty?
    students << {name: name, cohort: cohort.to_s}
    puts "Now we have #{students.count} students"
    puts "Next name please"
    name = gets.chomp.capitalize
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
