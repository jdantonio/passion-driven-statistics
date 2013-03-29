require 'rubygems'
require 'ratistics'
require 'ratistics_charts'
#require 'ratistics_charts_js'

def display(collection, count=10)
  count.times do |i|
    if block_given?
      pp yield(collection[i])
    else
      pp collection[i]
    end
  end
end

file = File.join(__dir__, 'data/marscrater_pds.csv')

definition = [
  :crater_id,
  nil,
  [:latitude_circle_image, :to_f],
  nil,
  [:diam_circle_image, :to_f],
  [:depth_rimfloor_topog, :to_f]
]

puts 'Loading crater data...'
craters = Ratistics::Load::Csv.file(file, :def => definition, :headers => true)
puts "Loaded #{craters.length} records."
puts

puts 'Sorting crater data...'
Ratistics.insertion_sort!(craters){|crater| crater[:crater_id]}
craters.freeze
puts "\t#{craters.length} records."
puts

puts "Latitude..."
latitude = Ratistics.frequency(craters, :as => :catalog){|crater| crater[:latitude_circle_image].floor}
#Ratistics.insertion_sort!(latitude){|datum| datum.first}
latitude.sort!{|datum| datum.first}
puts "\t#{latitude.length} records."

Ratistics::Chart::Histogram.simple_histogram('Frequency of Mars Crater Latitude', latitude, :from => :catalog)

puts "Diameter..."
diameter = Ratistics.frequency(craters, :as => :catalog){|crater| (crater[:diam_circle_image] * 100).floor}
#Ratistics.insertion_sort!(diameter){|datum| datum.first}
diameter.sort!{|datum| datum.first}
puts "\t#{diameter.length} records."

Ratistics::Chart::Histogram.simple_histogram('Frequency of Mars Crater Diameter', diameter, :from => :catalog)

puts "Depth..."
depth = Ratistics.frequency(craters, :as => :catalog){|crater| (crater[:depth_rimfloor_topog] * 100).floor}
#Ratistics.insertion_sort!(depth){|datum| datum.first}
depth.sort!{|datum| datum.first}
puts "\t#{depth.length} records."

Ratistics::Chart::Histogram.simple_histogram('Frequency of Mars Crater Depth', depth, :from => :catalog)

puts
puts 'Done.'
