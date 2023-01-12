len = charCount = intCount = symbolCount = 0

def take_user_input(l)
	yield if block_given?
	user_input = 0
	while user_input = Integer(gets.chomp) rescue ''
		if user_input.is_a? Integer
			if user_input > 0 && user_input <= l
				break
			end
		end
		print "Please enter a positive integer and grater than 0 and less than ",l+1,":\n"
	end
	return user_input
end

while true
	len = take_user_input(100) {print "\tEnter length of password: "}
	charCount = take_user_input(len) {print "\tEnter no of alphaets you want to use in password: "}
	if len-charCount > 0
		intCount = take_user_input(len-charCount) {print "\tEnter no of numberic values you want to use in password: "}
	end
	if len-charCount-intCount > 0
		symbolCount = take_user_input(len-charCount-intCount) {print "\tEnter no of  special character you want to use in password: "}
	end
	if len == charCount + intCount + symbolCount
		puts "Total length #{len}\nNumeric count: #{charCount}\nSpecial character count: #{intCount}\nAlphabets count: #{symbolCount}"
		break
	else
		puts "Total lengths not equal to some of character, number and special symbol count"
	end
end

def genrate_password(lent,arr,cond,rep)
	while cond > 0
		idx = rand(lent)
		if arr[idx] == '-1'
			if rep == 1
				arr[idx] = [*'a'..'z', *'A'..'Z'].shuffle[0]
			elsif rep == 2
				arr[idx] = [*'0'..'9'].shuffle[0]
			else
				arr[idx] = [*'!'..'/',*':'..'@',*'['..'`',*'{'..'~'].shuffle[0]
			end
			cond -= 1
		end
	end
	return arr
end

password = Array.new(len, '-1')
password = genrate_password(len,password,charCount,1)
password = genrate_password(len,password,intCount,2)
password = genrate_password(len,password,symbolCount,3)
finalPassword = password.join
puts "\n\n\t\tYour Password is ==> #{finalPassword}"
