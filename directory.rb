
# method to get students name from user
def input_students
  students = []

  puts 'Enter names of the students'
  puts 'To finish, hit enter twice'
  name = '-'
  until name.empty?
    name = gets.chomp
    students << { name: name, cohort: :november } unless name.empty?
    puts "Now we have #{students.count} students"
  end
  students
end

# method to print header
def print_header
  puts 'Students of Villian Academy'
  puts '---------------------------'
end

# method to print all students names and cohorts
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# method to print all students names with number in front of them
def print_with_numbers(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# method to print all students names starting with certain letter and cohorts
def print_name_starting_with(students, letter)
  names_with = []
  students.each { |student| names_with << student if student[:name].start_with?(letter) }
  names_with.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end

  # redundant code below (prints without storing in array)
  # students.each_with_index do |student, index|
  #  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0].start_with?(letter)
  # end
end

# method to print all students names and cohort where name is < 12 letters
def print_name_shorter_than_12_chars(students)
  names_with_less_chars = []
  students.each { |student| names_with_less_chars << student if student[:name].length < 12 }
  names_with_less_chars.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end


# method to print footer
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

students = []
students = input_students
print_header
print_name_starting_with(students,'a')
print(students)
print_with_numbers(students)
print_name_shorter_than_12_chars(students)
print_footer(students)
