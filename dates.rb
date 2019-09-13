require './playground'
require 'date'
require 'benchmark'

ITERATIONS = 100000

date = "2014-05-23"

print_header('PARSE')
report = MemoryProfiler.report do
  ITERATIONS.times { Date.parse(date) }
end
print_result(report)

puts 'BENCHMARK'
time = Benchmark.realtime do
  ITERATIONS.times { Date.parse(date) }
end
puts "%.3f" % time

print_header('STRPTIME')
report = MemoryProfiler.report do
  ITERATIONS.times { Date.strptime(date, '%Y-%m-%d') }
end
print_result(report)

puts 'BENCHMARK'
time = Benchmark.realtime do
  ITERATIONS.times { Date.strptime(date, '%Y-%m-%d') }
end
puts "%.3f" % time
