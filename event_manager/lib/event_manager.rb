# puts 'Event Manager Initialized!'

# contents = File.read('event_attendees.csv')
# puts contents


# lines = File.readlines('event_attendees.csv')
# lines.each do |line|
#   puts line
# end


# p File.exist? "event_attendees.csv"


# puts 'EventManager initialized.'

# lines = File.readlines('event_attendees.csv')
# lines.each do |line|
#   columns = line.split(",")
#   p columns
# end


# puts 'EventManager initialized.'

# lines = File.readlines('event_attendees.csv')
# lines.each do |line|
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

# puts 'EventManager initialized.'

# lines = File.readlines('event_attendees.csv')
# lines.each_with_index do |line,index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end


# require 'csv'
# puts 'EventManager initialized.'

# contents = CSV.open('event_attendees.csv', headers: true)
# contents.each do |row|
#   name = row[2]
#   puts name
# end


# require 'csv'
# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]
#   puts "#{name} #{zipcode}"
# end

# require 'csv'

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]

#   if zipcode.nil?
#     zipcode = '00000'
#   elsif zipcode.length < 5
#     zipcode = zipcode.rjust(5, '0')
#   elsif zipcode.length > 5
#     zipcode = zipcode[0..4]
#   end

#   puts "#{name} #{zipcode}"
# end

# require 'csv'

# def clean_zipcode(zipcode)
#   if zipcode.nil?
#     '00000'
#   elsif zipcode.length < 5
#     zipcode.rjust(5, '0')
#   elsif zipcode.length > 5
#     zipcode[0..4]
#   else
#     zipcode
#   end
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   puts "#{name} #{zipcode}"
# end


# def clean_zipcode(zipcode)
#     zipcode.to_s.rjust(5, '0')[0..4]
#   end
  
#   puts 'EventManager initialized.'
  
#   contents = CSV.open(
#     'event_attendees.csv',
#     headers: true,
#     header_converters: :symbol
#   )
  
#   contents.each do |row|
#     name = row[:first_name]
  
#     zipcode = clean_zipcode(row[:zipcode])
  
#     puts "#{name} #{zipcode}"
#   end


# require 'google/apis/civicinfo_v2'

# civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new

# civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

# response = civic_info.representative_info_by_address(address: 80202, levels: 'country', roles: ['legislatorUpperBody', 'legislatorLowerBody'])

# p response.officials


# require 'csv'
# require 'google/apis/civicinfo_v2'

# civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
# civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5, '0')[0..4]
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# contents.each do |row|
#     name = row[:first_name]
  
#     zipcode = clean_zipcode(row[:zipcode])
  
#     begin
#       legislators = civic_info.representative_info_by_address(
#         address: zipcode,
#         levels: 'country',
#         roles: ['legislatorUpperBody', 'legislatorLowerBody']
#       )
#       legislators = legislators.officials
  
#       legislator_names = legislators.map(&:name)
  
#       legislators_string = legislator_names.join(", ")
#     rescue
#       'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#     end
  
#     puts "#{name} #{zipcode} #{legislators_string}"
#   end


# require 'csv'
# require 'google/apis/civicinfo_v2'


# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5, '0')[0..4]
# end

# def legislators_by_zipcode(zip)
#   civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
#   civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

#   begin
#     legislators = civic_info.representative_info_by_address(
#       address: zip,
#       levels: 'country',
#       roles: ['legislatorUpperBody', 'legislatorLowerBody']
#     )
#     legislators = legislators.officials
#     legislator_names = legislators.map(&:name)
#     legislator_names.join(", ")
#   rescue
#     'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#   end
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# template_letter = File.read('form_letter.html')

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   legislators = legislators_by_zipcode(zipcode)

#   personal_letter = template_letter.gsub('FIRST_NAME', name)
#   personal_letter.gsub!('LEGISLATORS', legislators)

#   puts personal_letter
# end


# require 'csv'
# require 'google/apis/civicinfo_v2'
# require 'erb'

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# def legislators_by_zipcode(zip)
#   civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
#   civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

#   begin
#     civic_info.representative_info_by_address(
#       address: zip,
#       levels: 'country',
#       roles: ['legislatorUpperBody', 'legislatorLowerBody']
#     ).officials
#   rescue
#     'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#   end
# end

# puts 'EventManager initialized.'

# contents = CSV.open(
#   'event_attendees.csv',
#   headers: true,
#   header_converters: :symbol
# )

# template_letter = File.read('form_letter.erb')
# erb_template = ERB.new template_letter

# contents.each do |row|
#     id = row[0]
#     name = row[:first_name]
  
#     zipcode = clean_zipcode(row[:zipcode])
  
#     legislators = legislators_by_zipcode(zipcode)
  
#     form_letter = erb_template.result(binding)
  
#     Dir.mkdir('output') unless Dir.exist?('output')
  
#     filename = "output/thanks_#{id}.html"
  
#     File.open(filename, 'w') do |file|
#       file.puts form_letter
#     end
  
#   end


  require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end