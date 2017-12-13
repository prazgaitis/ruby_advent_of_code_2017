input = File.readlines("data/day4.txt")
valid = 0

input.each do |line|
	words = []
	duplicates = false
	line.split(" ").each do |word|
    if words.any? {|x| x.chars.sort.join == word.chars.sort.join }
			duplicates = true
		end
		words << word
	end
	valid += 1 if duplicates == false
end

puts valid
