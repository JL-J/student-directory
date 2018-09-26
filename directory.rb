# array of students

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp) # takes user input as argument
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show students by index"
  puts "3. Show students by cohort group"
  puts "4. Load the list of students"
  puts "5. Save the list of students"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students_index
    when "3"
      show_students_cohort
    when "4"
      load_students
    when "5"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again"
  end 
end

def save_students
  print "Do you want to save to students.csv? (Y/N)"
  answer = gets.chomp
  if answer == "N"
    print "Please write in the file you wish to save to:"
    filename = gets.chomp
  else 
    filename = "students.csv"
  end
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over array 
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "You have saved the students to students.csv"
end


def push_to_students(name, cohort, age)
  @students << {name: name, cohort: cohort.to_sym, age: age}
end

def load_students
  print "Do you want to load student data from a specific file? (Y/N)"
  answer = gets.chomp.upcase
  if answer == "Y"
    print "Please write in the file you wish to save to:"
    filename = gets.chomp
  else 
    filename = "students.csv"
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, age = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, age: age}
  end 
  file.close
  puts "You have loaded the student list from #{filename}"
  puts "There are currently #{@students.count} student(s) on this list"
end

def try_load_students
  @students = [] # an empty array accessible to all methods
  filename = ARGV.first # first argument from the command line
  if filename.nil? 
    if File.exists?("students.csv") 
      load_students
    end  
  elsif File.exists?(filename) 
    load_students(filename)
    puts "Loaded from #{filename}"
  else #if it doesn't exist
    puts "Sorry #{filename} doesn't exist"
    load_students
  end
end

def show_students_index
  print_header
  print_student_list_index
  print_footer
end

def show_students_cohort
  print_header
  print_student_list_cohort
  print_footer
end

def input_students
  # create an empty array
  puts "Do you want to add a student to the directory? (Y/N)"
  answer = gets.chomp.upcase
  until answer != "Y"
    puts "Please enter the name of the student and then press enter."
    name = STDIN.gets.chomp
    # if nothing entered name is set to unknown
      if name == ""
        name = "unknown"
      end
    puts "Please enter their cohort"
    cohort = gets.chomp.downcase
    # if nothing entered default cohort is set as May
      if cohort == ""
        cohort = :may
      end
    puts "How old are they?"
    age = gets.chomp
    # if nothing entered age is set to unknown
      if age == ""
        age = "unknown"
      end
    # add the student hash to the array
    push_to_students(name, cohort, age)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "Do you want to add another student? (Y/N)"
    answer = gets.chomp.upcase
  end
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end

def print_student_list_index
  @students.each_with_index do |(student), index|    
    puts "#{index+1} #{student[:name].center(20)} (#{student[:cohort]} cohort)"
  end
end 

def print_student_list_cohort
  students_by_cohort = Hash.new 
  @students.map do |student|
    if students_by_cohort[student[:cohort]] == nil
      students_by_cohort[student[:cohort]] = [student[:name]]
    else 
      students_by_cohort[student[:cohort]].push(student[:name])
    end
  end
  students_by_cohort.map do |key, value|
    puts "#{key.upcase}"
    value.map{|name| puts name}
  end
end 

def print_footer
  if @students.count == 0
    puts "There are no students enrolled at Villains Academy"
  elsif @students.count == 1
    puts "Overall we have #{@students.count} great student"
  else
    puts "Overall we have #{@students.count} great students"
  end
end

try_load_students
interactive_menu
