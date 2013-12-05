require 'csv'
file_to_read = ARGV.first
output_file = ARGV.last
CSV.open(output_file, 'w') do |csv|
  File.read(file_to_read).each_line do |line|
    csv << line.split(',')
  end
end
