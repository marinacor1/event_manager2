require 'csv'
puts "EventManager Initialized!"

# contents = CSV.open "event_attendees.csv"
# puts contents

lines = File.readlines "event_attendees.csv"
lines.each do |line|
  next if line == " ,RegDate,first_Name, last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
  columns = line.split(",")
  name = columns[2]
  puts name 
  puts columns
end

#in order to access columns[0], which is the first, split on column
