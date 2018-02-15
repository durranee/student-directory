#  Exercise 5 (getting more details) method to get students name from user
def input_students
  students = []

  name = '-'
  until name.empty?
    puts ''
    puts 'Enter name of the student'
    puts 'To finish, hit enter twice'
    name = gets.chomp
    break if name.empty?
    puts 'Enter Cohort'
    cohort = gets.chomp
    cohort = :february if cohort.empty?

    students << { name: name, cohort: cohort.to_sym }
    puts "Now we have #{students.count} " +
    ( students.count > 1 ? "students" : "student" )
  end
  students
end

# method to print header
def print_header
  puts ''
  puts ':::::::::Students of Villian Academy:::::::::'.center(70)
  puts '-------------------'.center(70)
end

# method to print footer
def print_footer(students)
  puts "Overall we have #{students.count} great " +
  (students.count > 1 ? "students" : "student")
end

# method to print all students names and cohorts (with number before them)
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end


# Method to print all students details if name starts with certain letters
def print_name_starting_with(students, letter)
  students.select! { |student| student[:name].start_with?(letter) }
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

students = []

print_header
students = input_students
# print_name_starting_with(students,'a')
# print(students)
print_with_all_details(students)
print_footer(students)
