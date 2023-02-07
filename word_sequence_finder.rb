#!/usr/bin/env ruby
# require 'csv'
# require 'open-uri'
# require 'pry'

# Encapsulation
class WordSequenceFinder

  def initialize(text)
		# Remove capitalization, punctuation, extra spaces and splits into individual element in array from the text
    @text = text.downcase.gsub(/-\n/,'').gsub(/[^a-z\s+'-]/, '').strip.split(" ")
		@word_sequence_counts = Hash.new(0)
  end

  # Separation of Concerns
  def three_word_sequences
		# time1 = Time.now
		# Loop through the words and create three word sequences
		# Docs for each_cons inbuild method of Ruby listed in README
		@text.each_cons(3) do |sequence|
			# Documentation for fetch is listed in README.md
			@word_sequence_counts[sequence] = @word_sequence_counts.fetch(sequence, 0) + 1
		end
		# time2 = Time.now
		# puts "Create hash mapping timing: #{time2 - time1}"
  end

	def most_common_sequences
		# start_sort_time = Time.now
		three_word_sequences
    @word_sequence_counts = @word_sequence_counts.sort_by { |_, count| -count }.first(100)
		@word_sequence_counts.each do |sequence, count|
			puts "#{sequence.join(" ")} - #{count}"
		end
		# end_sort_time = Time.now
		# puts "Sort Time: #{end_sort_time - start_sort_time}!"
	end
end

# Command Line Interface
# Check if any file paths were passed as arguments
# calculate processing time
time_start = Time.now
if ARGV.length > 0
  # Loop through the file paths and process the input
  ARGV.each do |file_path|
		# proceesing_time_start = Time.now
    # Open the file and read the contents
    input = open(file_path).read
    # Process the input and print the result
		puts "The first 100 most common three word sequences for #{file_path}: "
		finder = WordSequenceFinder.new(input)
		finder.most_common_sequences
		# processing_time_end = Time.now
		# puts "Processing Time: #{processing_time_end - proceesing_time_start}!"
  end
elsif
	# processing_time_start = Time.now
  # Read input from stdin
	input = $stdin.read
	# Process the input and print the result
  finder = WordSequenceFinder.new(input)
  puts "The first 100 most common three word sequences for: "
  finder.most_common_sequences
	# processing_time_start = Time.now
	# puts "Processing Time: #{processing_time_end - proceesing_time_start}!"
end

time_end = Time.now
puts "Total Time: #{time_end - time_start}!"
# puts "\n\n\n Next section is the test suite!"
puts "\n\n\n Next section is the test suite!"

# Comment this line to run specs manually without creating redefined methods
# require_relative './specs/word_sequence_finder_spec.rb'