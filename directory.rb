# array of students

def interactive_menu
  @students = [] # an empty array accessible to all methods
  loop do
    print_menu
    process(STDIN.gets.chomp) # takes user input as argument
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to students.csv"
  puts "4. Load the list of students from students.csv "
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again"
  end 
end

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over array 
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, age = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, age: age}
  end 
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry #{filename} doesn't exist"
    exit # quit the programme
  end
end

def show_students
  print_header
  print_student_list
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
    @students << {name: name, cohort: cohort.to_sym, age: age}
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

def print_student_list
  @students.each_with_index do |(student), index|    
    puts "#{index+1} #{student[:name].center(20)} (#{student[:cohort]} cohort)"
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
