
# method to get students name from user
def input_students
  students = []


  name = '-'
  until name.empty?
    puts 'Enter names of the students'
    puts 'To finish, hit enter twice'
    name = gets.chomp
    break if name.empty?
    p "Enter Hobbies: "
    hobbies = gets.chomp
    p 'Enter country: '
    country = gets.chomp
    p 'Enter date of birth: '
    dob = gets.chomp
    p 'Enter height: '
    height = gets.chomp

    students << { name: name, cohort: :november, hobbies: hobbies,
                  country: country, dob: dob, height: height }
    puts "Now we have #{students.count} students"
  end
  students
end

# method to print header
def print_header
  puts 'Students of Villian Academy'
  puts '---------------------------'
end

# method to print footer
def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

# method to print all students names and cohorts
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# method to print all the details of students
def print_with_all_details(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    puts "Hobbies: #{student[:hobbies]}"
    puts "Country: #{student[:country]}"
    puts "Date of birth: #{student[:dob]}"
    puts "Height: #{student[:height]}"
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

def print_all_without_each(students)
  index = 0
  while index < students.length
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

students = []
students = input_students
print_header
#print_name_starting_with(students,'a')
# print(students)
print_with_all_details(students)
#print_with_numbers(students)
#print_name_shorter_than_12_chars(students)
#print_all_without_each(students)
print_footer(students)
