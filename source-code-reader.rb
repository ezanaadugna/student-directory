directory = "/Users/ezana/desktop/github/student-directory"
filename = "#{directory}/directory-2.rb"
File.open(filename, "r") do |file|
  file.readlines.each do |line|
    puts line
  end
end
