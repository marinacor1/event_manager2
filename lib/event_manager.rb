
#   # lines = File.readlines "event_attendees.csv"
#   # lines.each do |line|
#   #   next if line == " ,RegDate,first_Name, last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
#   #   columns = line.split(",")
#   #   name = columns[2]
#   #   puts name
#   # end
#
#   #track by index
#   # row_index = 0
#   # lines.each_with_index do |line, index|
#   #   next if index == 1
#   #   columns = line.split(",")
#   #   name = columns[2]
#   #   puts name
#   # end
# end
#
# em = EventManager.new
# em.file_read
# em.contents_organization

require 'csv'
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end


  def legislators_by_zipcode(zipcode)
    legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

    legislator_names = legislators.collect do |legislator|
      "#{legislator.first_name} #{legislator.last_name}"
      end
      legislator_string = legislator_names.join(",")
        # puts "#{name} #{zipcode} #{legislator_string}"
  end

  puts "EventManager initialized."

  contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

  contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    legislators = legislators_by_zipcode(zipcode)
    puts "#{name} #{zipcode} #{legislators}"
  end

      # legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
      #accepts a signle zipcode and returns a comma- separated string of legislator names
