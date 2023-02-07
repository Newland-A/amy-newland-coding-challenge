# New Relic - Code Challenge - Three Word Sequences

Table of Contents

 - [Introduction](#introduction)
 - [Objective](#objective)
 - [Prerequisites](#prerequisites)
 - [Installation](#installation)
 - [Running Application using $stdin](#running-application-using-$stdin)
 - [Running Application using ARGV](#running-application-using-argv)
 - [Docker](#docker)
 - [Running Tests](#running-tests)
 - [TroubleShooting](#troubleshooting)
 - [What I would do next, with given more time?](#what-i-would-do-next-with-given-more-time)
 - [Known Bugs/Issues](#known-bugsissues)
 - [Related Resources](#related-resoirces)


## Introduction
	Hello my name is Amy Newland and I have 2 years of experience with Ruby on Rails, JavaScript, Docker, decent exposure to React. I am creating this application to become the next new Relic at New Relic. The interview process has been wonderful. I have really enjoy communicating with everyone and learning along the way and super excited to see what I will learn during my time at New Relic. I am excited to get to know the rest of the team. Thank you for you time.

## Objective
	Create a command line executable program that takes given text(s) and outputs list of first 100 most common three word sequences in descending order.

## Prerequisites
	- Minimum Ruby version 2.7.6
	- Docker for running Docker Container

## Installation
	# clone repository in your desired location locally.
		```https://github.com/Newland-A/amy-newland-coding-challenge.git```
	# cd amy-new-coding-challenge

	# Helpful tips
		* To output via csv file uncomment `require 'csv'` in word_sequence_finder.rb

## Running Application using $stdin
	` cat text_file text(s)_file | ruby_file In this case ./wordsequencefinder.rb `

## Running Application using ARGV
	`ruby ./wordsequencefinder.rb text(s)_file.rb `

## Docker
	The extra credit Docker requirement was achieved by providing a Dockerfile that can be used for building a Docker image and running the app within a Docker container.

	** Make sure Docker is running locally
	* Build image using:
		`docker build -t amy-newland-code-challenge .`
	* Run using:
		- Will run test suite as well when running this command if require is uncommented at bottom of word_sequence_finder.rb
		`docker run -it amy-newland-code-challenge`

## Running Tests
	* Tests can be run manually by running:
		`rspec specs/word_sequence_finder_spec.rb`

## TroubleShooting
 	* Container not running ruby word_sequence_finder and test suite. Double check the image has been built.
		- By running previous commands from [Docker](#docker) section
	* Incase input is not passed to ruby file_name command ctrl+c and re-enter comamnd with text

## What I would do next, with given more time?
	* Determine if the way I setup the tests to run is the actual best practice way of accomplishing the task.
	* Write more tests and that better cover edge cases and more scenarios.
	* Determine what we want to do with the text once we have collected it and make sure to cover those cases.
	* Cover how to handle when arugments are not passed to:
		`ruby file_name arg*` via stdin or ARGV
	* Determine how I can make the output more interesting to the reader?
	* Make application more secure in taking in input

## Known Bugs/Issues
   * When entering text make sure to enter either ARGV using file_name text_file_to_evaluate or stdin using
			`cat file_name or text | word_sequence_finder.rb`
			- Issue if neither are entered it will freeze in terminal and ctrl + c will need to be entered to escape and try again
			- Does not cover urls www.code-challenge.com or https://code-challenge.com, If we want to retain these urls for another purpose

## Related Resources
	- https://ruby-doc.org/3.2.0/Hash.html#method-i-fetch
	- https://rubydoc.info/stdlib/core/Enumerable:each_cons
