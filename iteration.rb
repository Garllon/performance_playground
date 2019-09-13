require './playground'
require 'Date'

print_header('READ ALL IN ONE')
report = MemoryProfiler.report do
  content = File.open('dates.txt')

  years = content.readlines.map {|line|line.split("/")[2].to_i}
  leap_years = years.count{|y|Date.leap?(y)}
  puts "The file contains #{leap_years} dates in leap years."
end
print_result(report)

print_header('READ LINE BY LINE')
report = MemoryProfiler.report do
  file = File.open("dates.txt", "r")
  leap_years = 0

  while line = file.gets
      year = line.split('/')[2].to_i
      leap_years += 1 if Date.leap? year
  end
  puts "The file contains #{leap_years} dates in leap years."
end
print_result(report)
