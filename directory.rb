def input_students
  puts "For each student, please enter the name and then the cohort"
  puts "To finish, just hit return thrice"
  students =[]
  puts "Enter name: "
  name = gets.chomp
  puts "Enter cohort: "
  cohort = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} student(s)"
    puts "Enter name: "
    name = gets.chomp
    puts "Enter cohort: "
    cohort = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end
def print(students)
  students.each_with_index { |student, index| 
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
  }
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end

students = input_students
print_header
print(students)
print_footer(students)