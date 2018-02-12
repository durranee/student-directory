students = ['Dr. Hannibal Lecter',
            'Darth Vader',
            'Nurse Ratched',
            'Michael Corleone',
            'Alex DeLarge',
            'The Wicked Witch of the West',
            'Terminator',
            'Freddy Krueger',
            'The Joker',
            'Joffrey Baratheon',
            'Norman Bates']

def print_header
  puts 'Students of Villian Academy'
  puts '---------------------------'
end

def print_names (students)
  students.each { |student| puts student }
end

def print_footer (students)
  puts "Overall we have #{students.count} great students"
end

print_header
print_names(students)
print_footer(students)
