INPUT = 361527

def float_div(x, y)
  (x / y.to_f).ceil
end

def build_square n
  if n == 1
    return 1
  else
    root = find_next_odd_square(n)
  end
end

def find_next_odd_square(n)
  root = 1
  while (root * root < n)
    root += 2
  end
  root
end


def find_index_of_root(n)
  i = 0
  root = 1
  while (root * root < n)
    root += 2
    i += 1
  end
  i
end

root = build_square(INPUT)
puts "square size #{root}"
dist_from_end = (root * root) - INPUT
puts "dfe #{dist_from_end}"
prev_root = root-2
puts "prev_root: #{prev_root}"

last_digit_in_prev = prev_root*prev_root
first_digit_in_square = prev_root*prev_root + 1

right = [first_digit_in_square, first_digit_in_square + (root - 2)]
top = [right[1] + 1, right[1] + (root - 1)]
left = [top[1] + 1, top[1] + root - 1]
bottom = [left[1] + 1, left[1] + root -1]

sides = [right, top, left, bottom]
s = sides.select { |side| INPUT.between?(side[0], side[1])}[0]

p s

mid = ((s[0] + s[1]) / 2)

dist = (INPUT - mid).abs

p (dist + find_index_of_root(INPUT))
