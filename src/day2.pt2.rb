input_lines = File.readlines(
  "./data/#{$0.split("/")[1]
  .split(".")[0]}.txt")
  .map(&:chomp)

def int_array(line)
  line.split.map(&:to_i)
end

def divisible(lo, hi)
  hi.each do |h|
    lo.each do |l|
      if h % l == 0
        return h / l
      end
    end
  end
end

def first_half(arr)
  arr.sort.slice(0, arr.length / 2)
end

def second_half(arr)
  arr.sort.slice(arr.length / 2, arr.length - 1)
end

def find_divisor_in(line)
  lo, hi = first_half(line), second_half(line)
  divisible(lo, hi)
end

def main(input)
  sum = 0
  input.map { |line| sum += find_divisor_in(int_array(line)) }
  sum
end

puts main(input_lines)
