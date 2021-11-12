require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'


def clean_zipcode(zip_code)
  zip_code.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip_code)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip_code,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')

  File.open("output/thanks_#{id}.html", 'w') do |file|
    file.puts form_letter
  end
end

puts '##########################'
puts 'Event Manager Initialized!'
puts "##########################\n\n"

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  id = row[0]
  first_name = row[:first_name]
  zip_code = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zip_code)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
end

puts '##########################'
puts 'Event Manager Finished!'
puts "##########################\n\n"
