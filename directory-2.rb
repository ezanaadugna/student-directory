require 'csv'

@students = []

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv.gitignore"
    puts "4. Load the list from students.csv"
    puts "9. Exit" # 9 because we'll be adding more items  
end

def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
end

def process(selection)
    case selection
    when "1"
        input_students
        puts "Students added successfully."
    when "2"
        show_students
    when "3"
        save_students
        puts "Student list saved successfully to students.csv.gitignore."
    when "4"
        load_students
        puts "Student list loaded successfully from students.csv.gitignore."
    when "9"
        exit
    else
        puts "I don't know what you mean, try again"
    end
  end

def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def get_name
    puts "Name: "
    STDIN.gets.chomp
end

def input_students
    puts  "Please enter the names of the students"
    puts "To finish, just hit return twice"

    name = STDIN.gets.chomp
#while the name is not empty, repeat this code
    loop do
        name = get.name
        break if name.empty?  
        add_student(name, :november)
        puts "Now we have #{@students.count} students"
    end
    return @students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort].to_s} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def show_students
    print_header
    print_students_list
    print_footer
end

def save_students
    puts "Enter filename to save (default: students.csv.gitignore):"
    filename = STDIN.gets.chomp
    filename = "students.csv.gitignore" if filename.empty?
  
    CSV.open(filename, "wb") do |csv|
      @students.each do |student|
        csv << [student[:name], student[:cohort]]
      end
    end
  
    puts "Student list saved successfully to #{filename}."
  end
  
def load_students(filename = "students.csv.gitignore")
    CSV.foreach(filename) do |row|
      name, cohort = row
      add_student(name, cohort)
    end
end
  
def try_load_st9udents
    filename = ARGV.first
    return if filename.nil?
    if File.exist?(filename)
      load_students(filename)
    else
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
 end


try_load_students
interactive_menu

