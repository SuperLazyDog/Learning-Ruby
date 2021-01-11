# require "csv"
require 'time'

csv_path = "dummy.csv"
unless File.exist? csv_path
    puts "UUID"
    File.open csv_path, 'w+' do |f|
        headers = [:string, :boolean, :long, :double, :time].join ','
        row = ["string", true, 1, 1.1, Time.new(2020, 12, 17)].join ','
        puts row
        f.puts headers
        rows = ""
        100.times do |i|
            rows += row+"\n"
        end
        10000.times do
            f.puts rows
        end
    end
end
