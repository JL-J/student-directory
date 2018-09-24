# Exercise 3: Modify your program to only print the students whose name is shorter than 12 characters.
# Removed user_input to have fixed array of students

students = [
           {name: "Dr. Hannibal Lecter", cohort: :november},
           {name: "Darth Vader", cohort: :november},
           {name: "Nurse Ratched", cohort: :november}
            ]

def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end

def print(students)
    students.map do |student|
      if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
end 

def print_footer(students)
    puts "Overall we have #{students.count} great students"
end

print_header
print(students)
print_footer(students)