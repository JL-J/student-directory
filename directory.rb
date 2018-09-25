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
    students.each { |student| puts "#{student[:name].center(20)} (#{student[:cohort]} cohort)"}
end 

def print_by_cohort(students)
  students_by_cohort = Hash.new 
  students.map do |student|
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

def print_footer(students)
    if students.count < 2
        puts "Overall we have #{students.count} great student"
    else
        puts "Overall we have #{students.count} great students"
    end
end

students = input_students
puts "Would you like to print student list by index or by cohort group? (index/ cohort)"
input = gets.chomp
print_header
  if input == "index"
    print(students)
  elsif input == "cohort"
    print_by_cohort(students)
  end
print_footer(students)