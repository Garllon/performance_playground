UNIT_PREFIXES = {
      0 => 'B',
      3 => 'kB',
      6 => 'MB',
      9 => 'GB',
      12 => 'TB',
      15 => 'PB',
      18 => 'EB',
      21 => 'ZB',
      24 => 'YB'
}.freeze

def print_header(title)
  puts ''
  puts "****** #{title} ******"
end

def print_result(report)
  puts ''
  puts "Total allocated: #{scale_bytes(report.total_allocated_memsize)}"
  puts "Total retained: #{scale_bytes(report.total_retained_memsize)}"
end

def scale_bytes(bytes)
  return "0 B" if bytes.zero?

  scale = Math.log10(bytes).div(3) * 3
  scale = 24 if scale > 24
  "%.2f #{UNIT_PREFIXES[scale]}" % (bytes / 10.0**scale)
end
