input_lines = File.readlines("./data/#{$0.split("/")[1].split(".")[0]}.txt").map(&:chomp)

def int_array(line)
  line.split.map(&:to_i)
end

def diff(arr)
  arr.max - arr.min
end

puts input_lines.map { |line| diff(int_array(line)) }.sum
