require './playground'

print_header('CREATE NEW OBJECT')
report = MemoryProfiler.report do
  message = 'Test'
  message += ' Ruby'
end
print_result(report)

print_header('APPEND')
report = MemoryProfiler.report do
  message = 'Test'
  message << ' Ruby'
end
print_result(report)
