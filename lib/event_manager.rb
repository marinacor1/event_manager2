require 'csv'
puts "EventManager Initialized!"

# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   next if line == " ,RegDate,first_Name, last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

#track by index
# row_index = 0
# lines.each_with_index do |line, index|
#   next if index == 1
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

contents = CSV.open 'event_attendees.csv', headers: true
contents.each do |row|
  name = row[2]
  puts name
end
