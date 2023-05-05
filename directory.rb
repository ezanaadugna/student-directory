# first, we print the list of students

def input_students
    puts  "Please enter the names of the students"
    puts "To finish, just hit return twice"
#empty array for names/cohort
    students = []
#get the first name
    name = gets.chomp
#while the name is not empty, repeat this code
    while !name.empty? do    
        students << {name: name, cohort: :november}
        name = gets.chomp
    end
    return students
end


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)