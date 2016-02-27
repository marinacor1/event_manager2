require 'pry'
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
class FileCheck
  def file_read
    contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
    contents.each do |row|
      name = row[:first_name]
      zipcode = row[:zipcode]
        if zipcode.nil?
          zipcode = '00000'
        else
          zipcode = zipcode_check(row[:zipcode])
        end
      puts "#{name} #{zipcode}"
    end
  end

  def zipcode_check(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end
end

  #if the zip code is exactly five digits, assume that its ok
  #if the zip code is more than 5 digits, truncate it to the first 5 digits
  #if the zip code is less than 5 digits, add zeros to the front until it becomes five digits

fc = FileCheck.new
fc.file_read
