#Ai Jian 700476
#core 1
class Creature
	def initialised
	attr_accessor :health
	@xPos = 0
	@yPos = 0
	@health = 100
	end
	def move_forward
	@xPos = @xPos + 10
	end
	def move_right
	@yPos = @yPos + 10
	end
	def get_distance_from_centre
	Math.sqrt(@xPos**2 + @yPos**2)
	end
end

#core 2
#1
def odd_even_array
	a = [1,2,3,4,5]
	eve_num=0
	odd_num=0
	a.each{|x| if x%2 == 0
			eve_num += 1
		else odd_num += 1
		end
	}
	if eve_num > odd_num
		puts ':even'
	else puts ':odd'
	end
end
odd_even_array

#2
def average
	a = [1,2,3,"abc"]
	b = 0
	c = Array.new
	a.each{|x| if x.is_a?(Numeric)
		c[b] = x
		b += 1
	end}
	puts c.inject(:+)/c.length
end
average

#3
def sum_binary
	a = [1,2,3,4,5]
	b = a.inject(:+)
	#puts b
	c = Array.new
	while b >= 1
		c.unshift(b%2)
		b = b/2
	end
	puts c.join()
end
sum_binary

#4
def flatten_array
	s = [1, 2, 3, [2, 4, 6, [11, 9]]]
	#puts s.length
	a = s.join(":")
	b = a.split(":")
	c = Array.new
	b.each{|x| c.push(x.to_i)}
	puts c.inspect
end
flatten_array

#core 3
class DiceRoll
	def initialised dice_num, side_num
		@dice_num = dice_num
		@side_num = side_num
	end
	# @dice_num = 2
	# @side_num = 6
	#puts @dice_num, @side_num
	def roll_dice
		dice_roll = Array.new
		for i in 1..@dice_num
			dice_roll.push( 1 + rand(@side_num))
		end
		#return dice_roll.inspect
		puts dice_roll.inspect
	end
	def all_possibilities
		all_poss = Array.new
		for j in 1..@dice_num
			(1..(@side_num)).each{|x| all_poss.push(x)}
		end
		#puts all_poss.inspect
		puts all_poss.combination(@dice_num).to_a.uniq.inspect
	end
end

#core 4
#First word begin with a uppercase letter followed by lowercase letters
#other words are lowercase except I
def regex_sentence
	puts "Enter a sentence:"
	STDOUT.flush
	sen = gets.chomp
	regex = /^[A-Z][a-z]*('[a-z]+)*(\s[a-zI]+('[a-zI]+)*)*(,\s[a-zI]+('[a-z]+)*(\s[a-z]+)*('[a-z]+)*)*(\.|\?|!|\...)$/
	if regex.match(sen)
		puts true
	else puts false
	end
end
regex_sentence

#Fixed line telephone numbers in Australia exist within four "Areas"
#"Trunk Access Code" (0), followed by the "Area Code" (2, 3, 7 or 8) plus the "Local" number. 
#Australian "Local Area" numbers are of eight digits in length
#Mobile phone numbers begin with 04, followed by eight digits. 
def regex_phone
	puts "Enter a phone number:"
	STDOUT.flush
	phone = gets.chomp
	regex = /^((04|02|03|07|08)\d{8})$/
	if regex.match(phone)
		puts true
	else puts false
	end
end
regex_phone

#double dot or @ is invalid, also no space
def regex_email
	puts "Enter a email:"
	STDOUT.flush
	email = gets.chomp
	regex = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-z]+([-.][a-z]+)*[a-z]$/
	if regex.match(email)
		puts true
	else puts false
	end
end
regex_email

#core 5
def num_regex_matches
	puts "Enter a string:"
	STDOUT.flush
	s = gets.chomp
	puts "Enter a regex:"
	STDOUT.flush
	regex = gets.chomp
	match = 0
	for i in 0..s.length-1	
		if regex.match(s[i])
		match += 1
		end
	end
	puts match
end
num_regex_matches

#core 6
def call_block
	if block_given?
		yield
	else puts :no_block_provided
	end
end
call_block
#call_block { puts "Hello"}

#core 7
def count_lines
	lines = 0
	File.open("exercise_7.txt", "r") do |file|
	while line = file.gets
		lines += 1
		#puts lines
		#puts line
		#puts line.length()
	end
	end
	puts lines
end
count_lines

#core 8
def unique_lines
	text1 = Array.new
	text2 = Array.new
	File.open("exercise_8_1.txt", "r") do |file1|
	while line = file1.gets
		text1 << line.chomp
		#puts text1.inspect
	end
	end

	
	File.open("exercise_8_2.txt", "r") do |file2|
	while line = file2.gets
		text2 << line.chomp
		#puts text2.inspect
	end
	end
	#puts text1.inspect,text2.inspect
	comp = text2.length-1
	for i in 0..text1.length-1
		for j in 0..comp
		if text1[i] == text2[j]
			text2.delete(text1[i])
			comp -= 1
			break
		else text2 << text1[i]
		end
		end
	end
	puts text2.uniq.inspect
end
unique_lines

#core 9
def longest_word(text)
	# STDOUT.flush
	# text = gets.chomp
	longest = 0
	longest_index = 0
	s = Array.new
	#puts text
	s << text.split(/\W/)
	a = s.join(":")
	#puts a.inspect
	b = a.split(":")
	c = Array.new
	b.each{|x| c.push(x.to_s)}
	puts c.inspect
	for i in 0..c.length-1
		if c[i].length > longest
		longest = c[i].length
		longest_index = i
		end
	end
	puts c[longest_index]
end
longest_word