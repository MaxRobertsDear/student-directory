@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3" 
    save_students
  when "9"
    exit # this will cause the programme to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def input_students
  puts "For each student, please enter the name and then the cohort"
  puts "To finish, just hit enter without entering a name"
  
  puts "Enter name: "
  name = gets.strip
  puts "Enter cohort: "
  cohort = gets.strip
  if cohort.empty?
    cohort = "Uknown"
  end

  while !name.empty? do
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} student(s)"
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
  @students
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print_student_list
  if @students.count > 0
    @students.each_with_index { |student, index| 
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    }
  else
    puts "There are no students in this cohort."
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student".center(40)
  else
    puts "Overall, we have #{@students.count} great students".center(40)
  end
end

interactive_menu
print_header
print_student_list
print_footer