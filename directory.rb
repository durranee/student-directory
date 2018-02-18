require 'csv'
@students = []

# method to add student hash to @students array
def add_to_students_array(name, cohort)
  @students << { name: name, cohort: cohort.to_sym }
end

def check_cohort(cohort_entered)
  cohorts = %w[Jan Feb Mar Apr May Jun July Aug Sep Oct Nov Dec]
  cohort_entered = 'Feb' if cohort_entered.empty?
  until cohorts.include?(cohort_entered)
    puts 'Please enter correct cohort if leave empty for Feb'
    cohort_entered = STDIN.gets.chomp.capitalize
    cohort_entered = 'Feb' if cohort_entered.empty?
  end
  cohort_entered
end

# method to get Input from user
def input_students
  name = '-'
  until name.empty?
    puts "\nEnter name of the student"
    puts 'To finish, hit enter twice'
    name = STDIN.gets.chomp
    break if name.empty?
    puts 'Enter Cohort (leave empty for Feb)'
    cohort = check_cohort(STDIN.gets.chomp.capitalize)
    add_to_students_array(name, cohort)
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

# method to save student info to database.csv or other if name given
def save_students(filename = "database.csv")
  CSV.open(filename, 'wb') do |csv| #using csv library to make things easier
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "----- Data saved to #{filename} -----"
end

# method to load student details from database.csv and load to @student var
def load_students(filename = "database.csv")
  @students = [] # emptying @student before loading data to avoid duplicates
  CSV.foreach(filename) do |record| # using CSV library to load records
    name, cohort = record
    add_to_students_array(name, cohort)
  end
  puts "----- #{filename} loaded Successfully -----"
end

# method to load database file on boot
def try_load_students
  filename = ARGV.first # checks if argrument given at command line
  if filename.nil? # load default databse file if no args given
    load_students
    return
  end

  if File.exists?(filename) # if file exists then load the file innit bro
    load_students(filename)
     puts "Loaded #{@students.count} records from #{filename}"
  else # if it doesn't exist
    # show error message about file not found and exit the program
    puts "Error! #{filename} not found."
    puts 'Exiting...'
    exit
  end
end

# method to forward action on save/load database file
def act_on_file(action)
  puts "Please enter the database file name to #{action}"
  puts "leave blank for default"
  filename = STDIN.gets.chomp
  filename = 'database.csv' if filename.empty?
  action == 'save' ? save_students(filename) : load_students(filename)

end

# method to just print menu options
def print_menu
  puts '1. Input students details'
  puts '2. Show students'
  puts '3. Show students sorted by cohort'
  puts '4. Load student list from database'
  puts '5. Save student list to database'
  puts '9. Exit' # 9 because we'll be adding more items
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
  when '3'
    print_by_cohorts
  when '4'
    act_on_file('load')
  when '5'
    act_on_file('save')
  when '9'
    exit # to terminate the program
  else
    puts 'I don\'t know what you meant, try again'
  end
end

# entry point to our program method invokes menu and selection methods
def interactive_menu
  loop do
    print_header
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
