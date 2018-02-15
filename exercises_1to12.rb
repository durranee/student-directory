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
    puts 'Enter Hobbies'
    hobbies = gets.chomp
    puts 'Enter country'
    country = gets.chomp
    puts 'Enter date of birth'
    dob = gets.chomp
    puts 'Enter height'
    height = gets.chomp

    students << { name: name, cohort: cohort.to_sym, hobbies: hobbies,
                  country: country, dob: dob, height: height }
    puts "Now we have #{students.count} " +
    (students.count > 1 ? 'students' : 'student')
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
  (students.count > 1 ? 'students' : 'student')
end

# method to print all students names and cohorts
def print(students)
  students.each do |student|
    puts "Name: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Exercise 1: method to print all students names with number in front of them
def print_with_numbers(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Exercise 2: method to print all students names starting with certain letter and cohorts
def print_name_starting_with(students, letter)
  students.select! { |student| nstudent[:name].start_with?(letter) }
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Exercise 3: method to print all students names and cohort where name is < 12 letters
def print_name_shorter_than_12_chars(students)
  students.select! { |student| student[:name].length < 12 }
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Exercise 4: printing all students names and cohort without using .each()
def print_all_without_each(students)
  index = 0
  while index < students.length
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

# Exercise 5 part 2: method to print all the details of students
def print_with_all_details(students)
  students.each do |student|
    puts "Name: #{student[:name]}".ljust(70)
    puts "Cohort: #{student[:cohort]} cohort".ljust(70)
    puts "Hobbies: #{student[:hobbies]}".ljust(70)
    puts "Country: #{student[:country]}".ljust(70)
    puts "Date of birth: #{student[:dob]}".ljust(70)
    puts "Height: #{student[:height]}".ljust(70)
    puts '---------------'.ljust(50)
  end
end

students = []

print_header
students = input_students
# print_name_starting_with(students,'a')
# print(students)
# print_with_all_details(students)
# print_with_numbers(students)
# print_name_shorter_than_12_chars(students)
# print_all_without_each(students)
print_footer(students)
