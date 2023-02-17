#!/usr/bin/env ruby
# require 'csv'
# require 'open-uri'
# require 'pry'

class WordSequenceFinder

  def initialize(text)
    @text = sanitize_input(text)
  end

  def three_word_sequences
		# changed for testing purposes instead of multiple double nested arrays changed to single nested arrays for easier readability
		# @text.each_cons(3) do |sequence|
		# 	@word_sequence_counts[sequence] = @word_sequence_counts.fetch(sequence, 0) + 1
		# end
		@word_sequence_counts = Hash.new(0)
		(0..@text.length-3).each do |i|
    	sequence = "#{@text[i]} #{@text[i+1]} #{@text[i+2]}"
    	@word_sequence_counts[sequence] += 1
		end
  end

	def most_common_sequences
		three_word_sequences
    @word_sequence_counts = @word_sequence_counts.sort_by { |_, count| -count }.first(100)
		@word_sequence_counts.each do |sequence, count|
			puts "#{sequence} - #{count}"
		end
	end

	private

	def sanitize_input(input)
		input.dup.force_encoding('UTF-8').downcase.gsub(/-\n/, '').gsub(/[^a-z'\s-]/, '').split(" ")
	end
end

time_start = Time.now
# Before pair programming sessions
=begin
	if ARGV.empty?
		puts "Error: No input was provided."
		puts "Usage: ruby ./word_sequence_finder.rb <input_string>"
		exit 1
	elsif ARGV.length > 0
		ARGV.each do |file_path|
			input = open(file_path).read
			puts "\nThe first 100 most common three word sequences for #{file_path}: "
			finder = WordSequenceFinder.new(input)
			finder.most_common_sequences
		end
	elsif
		input = $stdin.read
		finder = WordSequenceFinder.new(input)
		puts "The first 100 most common three word sequences for: "
		finder.most_common_sequences
	end
=end

# AFTER Pair programming sessions
if ARGV.empty?
	puts "Please enter some text to search (press Ctrl+D when done):"
	input = $stdin.read
	finder = WordSequenceFinder.new(input)
	finder.most_common_sequences
else
	ARGV.each do |file_path|
		input = File.read(file_path)
		puts "\nThe first 100 most common three word sequences for #{file_path}: "
		finder = WordSequenceFinder.new(input)
		finder.most_common_sequences
	end
end

puts "\n\n\nNext section is the test suite!"
time_end = Time.now
puts "Total Time: #{time_end - time_start}!\n"
require_relative "./specs/word_sequence_finder_spec.rb"



=begin
	Alternative solutions listed below with notes:
	alternative modifified version that doesn't rely
	on WordSequenceFInder as an instance and instead takes text as an argument
	However this begs the question that this is not using ruby best practices and it is not
	going against SRP(Single Responsibility Principle) in the original layout The command line
	interface code is separate from the class, and it is responsible for parsing the input
	and running the most_common_sequences method on the WordSequenceFinder instance.
=end

### ALTERNATIVE SOLUTION 1 ###

=begin
	class WordSequenceFinder
		def initialize(text)
			@text = sanitize_input(text)
			@word_sequence_counts = Hash.new(0)
		end

		def most_common_sequences
			three_word_sequences
			@word_sequence_counts = @word_sequence_counts.sort_by { |_, count| -count }.first(100)
			@word_sequence_counts.each do |sequence, count|
				puts "#{sequence.join(" ")} - #{count}"
			end
		end

		def self.run
			time_start = Time.now

			if ARGV.empty?
				puts "Error: No input was provided."
				puts "Usage: ruby ./word_sequence_finder.rb <input_string>"
				exit 1
			end

			ARGV.each do |file_path|
				input = File.read(file_path)
				puts "\nThe first 100 most common three word sequences for #{file_path}: "
				finder = WordSequenceFinder.new(input)
				finder.most_common_sequences
			end

			time_end = Time.now
			puts "Total Time: #{time_end - time_start}!"
		end

		private

		def sanitize_input(text)
			text.dup.force_encoding('UTF-8').downcase.gsub(/-\n/, '').gsub(/[^a-z'\s+-]/, '').split(" ")
		end

		def three_word_sequences
			@text.each_cons(3) do |sequence|
				increment_sequence_count(sequence)
			end
		end

		def increment_sequence_count(sequence)
			@word_sequence_counts[sequence] += 1
		end
	end

	WordSequenceFinder.run

=end


### ALTERNATIVE SOULTION 2  ###
=begin
	class WordSequenceFinder
		def self.most_common_sequences(text)
			text = sanitize_input(text)
			word_sequence_counts = Hash.new(0)
			text.each_cons(3) do |sequence|
				increment_sequence_count(word_sequence_counts, sequence)
			end
			word_sequence_counts = word_sequence_counts.sort_by { |_, count| -count }.first(100)
			word_sequence_counts.each do |sequence, count|
				puts "#{sequence.join(" ")} - #{count}"
			end
		end

		def self.run
			time_start = Time.now

			if ARGV.empty?
				puts "Error: No input was provided."
				puts "Usage: ruby ./word_sequence_finder.rb <input_string>"
				exit 1
			end

			ARGV.each do |file_path|
				input = File.read(file_path)
				puts "\nThe first 100 most common three word sequences for #{file_path}: "
				most_common_sequences(input)
			end

			time_end = Time.now
			puts "Total Time: #{time_end - time_start}!"
		end

		private

		def self.sanitize_input(text)
			text.dup.force_encoding('UTF-8').downcase.gsub(/-\n/, '').gsub(/[^a-z'\s+-]/, '').split(" ")
		end

		def self.increment_sequence_count(word_sequence_counts, sequence)
			word_sequence_counts[sequence] += 1
		end
	end

	WordSequenceFinder.run
=end
