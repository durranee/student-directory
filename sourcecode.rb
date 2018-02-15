def read_self(file_name)
  file = File.open(file_name, 'r').each_line do |line|
    puts line
  end
end

read_self(__FILE__)
