@students = []

#  method to get Input from user
def input_students
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

    @students << { name: name, cohort: cohort.to_sym }
    puts "Now we have #{@students.count} " +
    (@students.count > 1 ? 'students' : 'student')
  end
end

# method to print header
def print_header
  puts ''
  puts ':::::::::Students of Villian Academy:::::::::'.center(70)
  puts '-------------------'.center(70)
end

# method to print footer
def print_footer
  puts "Overall we have #{@students.count} great " +
  (@students.count > 1 ? 'students' : 'student')
end

# method to print all students names and cohorts (with number before them)
def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
  puts ''
end

# Method to print all students details if name starts with certain letters
def print_name_starting_with(letter)
  @students.select! { |student| student[:name].start_with?(letter) }
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Method to print all students by cohorts
def print_by_cohorts
  cohort_list = @students.collect { |student| student[:cohort] }
  cohort_list.uniq.each do |cohort|
    puts "\n::: #{cohort.to_s.capitalize} Cohort :::"
    @students.each do |student|
      student[:cohort].eql?(cohort) ? (puts student[:name].to_s) : next
    end
  end
end


# method to just print menu options
def print_menu
  puts "1. Input students details"
  puts "2. Show students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

# method to invoke methods upon as per selection

def process(selection)
  case selection
  when '1'
    input_students
  when '2'
    show_students
  when '9'
    exit # to terminate the program
  else
    puts 'I don\'t know what you meant, try again'
  end
end

# entry point to our program method invokes menu and selection methods
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
