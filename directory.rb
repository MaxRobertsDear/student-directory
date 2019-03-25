def input_students
  puts "For each student, please enter the name and then the cohort"
  puts "To finish, just hit enter without entering a name"
  students =[]
  puts "Enter name: "
  name = gets.strip
  puts "Enter cohort: "
  cohort = gets.strip
  if cohort.empty?
    cohort = "Uknown"
  end

  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} student(s)"
    puts "Enter name: "
    name = gets.strip
    if name.empty? 
      break
    end
    puts "Enter cohort: "
    cohort = gets.strip
    if cohort.empty?
      cohort = "Uknown"
    end
    
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
  if students.count == 1
    puts "Overall, we have 1 great student".center(40)
  else
    puts "Overall, we have #{students.count} great students".center(40)
  end
end

students = input_students
print_header
print(students)
print_footer(students)