input = File.read("./data/#{$0.split("/")[1].split(".")[0]}.txt").chomp.split("").map(&:to_i)

def find_sum(input)
  sum = 0
  first_half = input.slice(0, input.length / 2)
  new_input = input + first_half
  input.each_with_index {|n, ix| sum += n if n == new_input[ix + (input.length / 2)] }
  sum
end

def check(input, answer)
  puts find_sum(input) == answer ? "😎" : "😨"
end

test_cases = [
  [[1,2,1,2], 6],
  [[1,2,2,1], 0],
  [[1,2,3,4,2,5], 4],
  [[1,2,3,1,2,3], 12],
  [[1,2,1,3,1,4,1,5], 4]
].map {|x| check(x[0], x[1]) }

puts find_sum(input)


