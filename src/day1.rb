# read data
input = File.read("./data/#{$0.split("/")[1].split(".")[0]}.txt").chomp.split("").map(&:to_i)

sum = 0
input.push(input.first)
input.each_with_index {|n, ix| sum += n if n == input[ix + 1] }

puts sum

