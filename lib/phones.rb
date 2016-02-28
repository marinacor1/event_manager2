require 'pry'
require 'csv'
puts "EventManager initialized!"

def clean_phones(phone)
  if phone.length < 10
    phone = 'bad'
  elsif phone.length == 11
    if phone[0] == '1'
      phone = phone[1..-1]
    else
      phone = 'bad'
    end
  elsif phone.length > 10
    phone = 'bad'
  else
    phone
  end
  phone
end

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
contents.each do |row|
  home_phone = row[:homephone]
  home_phone.gsub!(/\D/, "")
  phone = clean_phones(home_phone)
  puts phone
end
