require 'pry'
require 'csv'
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

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
class FileCheck
  def file_read
    contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
    contents.each do |row|
      name = row[:first_name]
      zipcode = zipcode_check(row[:zipcode])
      puts "#{name} #{zipcode}"
    end
  end

  def zipcode_check(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end
end
puts "EventManager Initialized!"

fc = FileCheck.new
fc.file_read
