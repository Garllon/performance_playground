require './playground'

STRING = 'Haha hah hahaa ahah!!'
FIND = 'a'
REPLACE = 'o'

print_header('String .tr')
report = MemoryProfiler.report do
  1_000_000.times { STRING.tr(FIND, REPLACE) }
end
print_result(report)

print_header('String .gsub')
report = MemoryProfiler.report do
  1_000_000.times { STRING.gsub(FIND, REPLACE) }
end
print_result(report)

print_header('Benchmark')
Benchmark.bmbm do |bm|
  bm.report '.tr' do
    1_000_000.times { STRING.tr(FIND, REPLACE) }
  end

  bm.report '.gsub' do
    1_000_000.times { STRING.gsub(FIND, REPLACE) }
  end
end
