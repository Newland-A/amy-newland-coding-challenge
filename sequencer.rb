#!/usr/bin/env ruby

require 'optparse' #built right into ruby and can help provide or even create help docs
options = {}
OptionParser.new do |opts|
	opts.banner = "Usage: sequencer.rb [options]"
	# opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
	# 	options[:verbose] = v
	# end
	opts.on("-")
end.parse!

puts "this is the sequenecer that is going to output counts of the highest quantities"
puts options
puts ARGV

#Step 1 - Create plan for what I need to accomplish
	# - Seems unneccessary but for knowledge purposes to make this file readable shebang!
	# take in user input manually or stdin
		# this case moby_dick.txt || brothers-karamazov.txt
	# look over input and return all 3 word sequences
	# count sequences
	# return the first 100 sequences orderd_by largest quntity
	# Example OUTPUT
		# this is three - count for this sequence
#Step 2 - Setup tests for easier testing that solution is working properly
	#Test positive cases ex. ("this is three - #{count}")
	#test false cases ex. ("this is three - 1") cause this is not repeated so does not need to be included
	#test cases where one has punctuation and the other does not ex. "This is three" == "This is three"
	#other cases to test
		#"Can't we just" was not translated to "Can t we just"
		# tests order of count is in decescending order
# Step 3 - Rememebr to make notes in the Readme as you go along so you can create a awesome readme
	# write what you need to setup any requirements of software or gems
	# any special extras
	# Any bugs that I am aware of
	# What you would do given more time (if anything)
	# How to run tests

class Sequencer
	def ignore_cases
		# ignore punctuation, line endings, and is case insensitive
	end

	def something

	end

	private

	def something
		# take in users input
	end
end
