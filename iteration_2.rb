require './playground'

class Thing; end

print_header('EACH OVER OBJECTS')
report = MemoryProfiler.report do
  list = Array.new(100) { Thing.new }
  list.each do |item|
    GC.start
    puts ObjectSpace.each_object(Thing).count
  end

  list = nil
  GC.start
  puts ObjectSpace.each_object(Thing).count
end
print_result(report)

print_header('RELEASE FROM MEMORY')
report = MemoryProfiler.report do
  list = Array.new(100) { Thing.new } # allocate 1000 objects again

  while list.count > 0
    GC.start # this will garbage collect item from previous iteration
    puts ObjectSpace.each_object(Thing).count # watch the counter decreasing
    list.shift
  end

  GC.start # this will garbage collect item from previous iteration
  puts ObjectSpace.each_object(Thing).count
end
print_result(report)
