def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    students = []
    name = gets.chomp
    
    while !name.empty? do
      puts "Please enter the cohort of the student"
      cohort = gets.chomp
      cohort = cohort.empty? ? :november : cohort.downcase.to_sym
      
      puts "Please enter the hobbies of the student (or press enter to skip)"
      hobbies = gets.chomp
      hobbies = hobbies.empty? ? "(no hobbies listed)" : hobbies
      
      puts "Please enter the country of birth of the student (or press enter to skip)"
      country = gets.chomp
      country = country.empty? ? "(country of birth not listed)" : country
      
      puts "Please enter the height of the student (in cm) (or press enter to skip)"
      height = gets.chomp
      height = height.empty? ? "(height not listed)" : "#{height}cm"
      
      students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
      
      if students.count == 1
        puts "Now we have 1 student"
      else
        puts "Now we have #{students.count} students"
      end
      
      name = gets.chomp
    end
    
    students
end
  

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
def print_students(students)
    # create a list of unique cohorts
    cohorts = students.map { |student| student[:cohort] }.uniq
    
    # iterate over each cohort and print the students in that cohort
    cohorts.each do |cohort|
      puts "Students in the #{cohort.capitalize} cohort:"
      students_in_cohort = students.select { |student| student[:cohort] == cohort }
      students_in_cohort.each_with_index do |student, index|
        puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, country: #{student[:country]}, height: #{student[:height]}cm)"
      end
      puts "\n"
    end
end
  
def print_footer(students)
    if students.length == 1
      puts "Overall, we have 1 great student"
    elsif students.length > 1
      puts "Overall, we have #{students.count} great students"
    end
end
  
  students = input_students
  
if students.length > 0
    print_header
    print_students(students)
    print_footer(students)
  else
    puts "There are no students to display."
end
  