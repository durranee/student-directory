=begin
  { name: 'Dr. Hannibal Lecter', cohort: :november },
  { name: 'Darth Vader', cohort: :november },
  { name: 'Nurse Ratched', cohort: :november },
  { name: 'Michael Corleone', cohort: :november },
  { name: 'Alex DeLarge', cohort: :november },
  { name: 'The Wicked Witch of the West', cohort: :november },
  { name: 'Terminator', cohort: :november },
  { name: 'Freddy Krueger', cohort: :november },
  { name: 'The Joker', cohort: :november },
  { name: 'Joffrey Baratheon', cohort: :november },
  { name: 'Norman Bates', cohort: :november }
]
=end


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

def print_header
  puts 'Students of Villian Academy'
  puts '---------------------------'
end

def print_name_starting_with(students, letter)
  student_names_with = []
  students.each { |student| student_names_with << student if student[:name].start_with?(letter) }
  student_names_with.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:chort]} cohort)"
  end

  # redundant code below (prints without storing in array)
  # students.each_with_index do |student, index|
  #  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0].start_with?(letter)
  # end
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

students = []
students = input_students
print_header
puts 'Enter letter you wanna see students name starting from'
letter = gets.chomp
print_name_starting_with(students,letter)
#print(students)
print_footer(students)
