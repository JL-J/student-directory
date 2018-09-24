# array of students

def input_students
    puts "Please enter the names of the student."
    puts "To finish, hit return twice"
    # create an empty array
    students = []
    name = gets.chomp
    # while the name is not empty repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
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