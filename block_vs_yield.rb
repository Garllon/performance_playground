require './playground'
require 'benchmark'

def yield_example_method
  yield
end

def block_example_method(&block)
  block.call
end


print_header('USE YIELD')
report = MemoryProfiler.report do
  1_000_000.times do
    yield_example_method do
      'test'
    end
  end
end
print_result(report)

print_header('USE BLOCK')
report = MemoryProfiler.report do
  1_000_000.times do
    block_example_method do
      'test'
    end
  end
end
print_result(report)

print_header('Benchmark')
Benchmark.bmbm do |bm|
  bm.report 'yield' do
    1_000_000.times do
      yield_example_method do
        'test'
      end
    end
  end

  bm.report 'block' do
    1_000_000.times do
      block_example_method do
        'test'
      end
    end
  end
end