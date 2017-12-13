input = File.readlines("data/day4.txt")
valid = 0

input.each do |line|
	words = []
	duplicates = false
	line.split(" ").each do |word|
		if words.include? word
			duplicates = true
		end
		words << word
	end
	valid += 1 if duplicates == false
end

puts valid

puts input.count
