# array of students

def input_students
  # create an empty array
  students = []
  answer = "Y"
  until answer != "Y"
    puts "Please enter the name of the student and then press enter."
    name = gets.chomp
    puts "Please enter their cohort"
    cohort = gets.chomp.downcase
      if cohort == ""
        cohort = :may
      end
    puts "How old are they?"
    age = gets.chomp
      if age == ""
        age = "99"
      end
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, age: age}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Do you want to add another student? (Y/N)"
    answer = gets.chomp.upcase
  end
    # return the array of students
    students 
end
def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end

def print(students)
    students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end 

def print_footer(students)
    if students.count < 2
        puts "Overall we have #{students.count} great student"
    else
        puts "Overall we have #{students.count} great students"
    end
end

students = input_students
print_header
print(students)
print_footer(students)