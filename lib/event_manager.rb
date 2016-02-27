require 'csv'
# require_relative '../lib/event_attendees.csv'
puts "EventManager Initialized!"

# contents = CSV.open "event_attendees.csv"
# puts contents

lines = File.readlines "event_attendees.csv"
lines.each do |line|
  puts line
end
