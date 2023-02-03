# Bonus setup some interaction in saying hello and that I am excited to chat
class Introduction
	def say_hello
		set_evaluators_name
		puts "Hello #{name}, Thank you for taking the time to evaluate my solution." + "I look forward to speaking with you soon."
	end

	private

	def set_evaluators_name
		puts "Hello, Please enter your name below?"
		name = gets.chomp
	end
end

puts say_hello
