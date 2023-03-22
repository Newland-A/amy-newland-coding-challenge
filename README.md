# Code Challenge - Three Word Sequences

## Table of Contents

 - [Introduction](#introduction)
 - [Objective](#objective)
 - [Prerequisites](#prerequisites)
 - [Installation](#installation)
 - [Running Application](#running-application)
 - [Docker](#docker)
 - [Running Tests](#running-tests)
 - [TroubleShooting](#troubleshooting)
 - [Future Improvements?](#future-improvements)
 - [Known Bugs/Issues](#known-bugsissues)
 - [Related Resources](#related-resources)
 - [Updates](#updates)


## Introduction
Hello, I'm Amy Newland, a software developer with 2 years of experience in Ruby on Rails, JavaScript,
and Docker. I'm passionate about continuously improving my skills and honing my craft, which is why
I'm currently building this new application. As I search for my next career opportunity, I've had
the pleasure of interviewing with some amazing individuals and organizations, and I'm committed to
further personal and professional growth. I'm excited to connect with new people and potential
employers who share my passion for technology and innovation. Thank you for your time and consideration.

## Objective
The objective of this coding challenge is to create a command line executable program that takes
given text(s) and outputs a list of the 100 most common three-word sequences in descending order.
Punctuation, spacing, new-lines, trailing hypens, and Unicode should be ignored.

For example, "I love\nsandwiches." should be treated the same as "(I LOVE SANDWICHES!!)".
Contractions should not be changed into two words (e.g., can't should not become can t).
Hyphens on line-endings can be treated as continuations or punctuation. Unicode may also
be handled in any way you like (including replacing it with a space).

## Prerequisites
To run this program, you will need:

	Ruby 2.7.6 or higher
	Docker (optional)

## Installation
To install and run the application, follow these steps:

	Clone the repository to your local machine:
		git clone https://github.com/Newland-A/amy-newland-coding-challenge.git

	Navigate to the application directory:
		cd amy-newland-coding-challenge

To output via csv file uncomment `require 'csv'` in word_sequence_finder.rb

## Running Application
- Using $stdin
	` cat text(s)_file | ./wordsequencefinder.rb `

- Using ARGV
	`ruby ./wordsequencefinder.rb text(s)_file.rb `

## Docker
	1. Make sure Docker is running locally
	2. Build the Docker image by running the following command in the project directory:
		`docker build -t amy-newland-code-challenge .`
	3. Run the Docker container by running the following command:
		`docker run -it amy-newland-code-challenge`

This will also run the test suite, which can be disabled by commenting out the require statement at the bottom of word_sequence_finder.rb.

## Running Tests
The test suite can be run manually by uncommenting the first line of `specs/word_sequence_finder_spec.rb` and then running the following command:
- `rspec specs/word_sequence_finder_spec.rb`

Tests can also be run simultaneously with ARGV or $stdin commands by uncommenting the last line of `word_sequence_finder.rb`.

## TroubleShooting
* If the container is not running ruby word_sequence_finder and the test suite, double check that the image has been built by running the commands from the Running with Docker section.
* If no input is passed, the application will return an error message with usage notes.
* When entering text either through ARGV using `ruby file_name text_file_to_evaluate` or through stdin using `cat file_name or text | word_sequence_finder.r`, if no text argument is provided, the terminal will stall. Use `ctrl + c` to exit and then re-enter the command with the appropriate text argument.

## Future Improvements
Given more time, the following improvements could be made:

* Write additional tests that cover edge cases and more scenarios.
* Determine if the current test setup is the best practice way of accomplishing the task.
* Determine what to do with the text once it has been collected and ensure that all cases are covered.
* Make the output more visually appealing and interesting to work with.
* Increase the security of the application by improving input validation.

## Known Bugs/Issues
* URLs entered as input are not correctly handled and will return with missing periods.
* Text files with non-ASCII characters or the ' symbol may cause errors.

## Related Resources
	- https://ruby-doc.org/3.2.0/Hash.html#method-i-fetch
	- https://rubydoc.info/stdlib/core/Enumerable:each_cons
