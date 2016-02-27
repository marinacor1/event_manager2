require 'csv'
# require_relative '../lib/event_attendees.csv'
puts "EventManager Initialized!"

contents = CSV.open "event_attendees.csv"
puts contents
