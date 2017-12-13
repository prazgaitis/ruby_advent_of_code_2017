input = File.readlines("data/day4.txt")
valid = 0

class String
  def anagram? word
    self.chars.sort.join == word.chars.sort.join
  end
end

input.each do |line|
	words = []
	duplicates = false
	line.split(" ").each do |word|
		if words.any? {|x| x.anagram?(word) }
			duplicates = true
		end
		words << word
	end
	valid += 1 if duplicates == false
end

puts valid
