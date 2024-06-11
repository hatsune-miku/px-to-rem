target = %q(C:\path\to\index.less)
suffix = '.out.less'
root_font_size = 10

content = File.read target
new_content = content.lines.map do |line|
  if line =~ /\b(\d+)px\b/
    rem_value = ($1.to_i.to_f / root_font_size).to_s
    line.gsub! /\b(\d+)px\b/, "#{rem_value}rem"
  end
  line
end

File.open(target + suffix, 'w') do |f|
  new_content.each { |line| f.puts(line) }
end

puts "Output: ", target + suffix
