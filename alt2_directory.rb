# Exercise 2: Modify your program to only print the students whose name begins with a specific letter.
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
# This will only print students whose name begins with the letter D
def print(students)
    students.map do |student|
      if student[:name][0] == "D"
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