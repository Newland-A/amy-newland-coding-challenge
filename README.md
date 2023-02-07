# New Relic - Code Challenge - Three Word Sequences

## Table of Contents

 - [Introduction](#introduction)
 - [Objective](#objective)
 - [Prerequisites](#prerequisites)
 - [Installation](#installation)
 - [Running Application](#running-application)
 - [Docker](#docker)
 - [Running Tests](#running-tests)
 - [TroubleShooting](#troubleshooting)
 - [What I would do next, with given more time?](#what-i-would-do-next-with-given-more-time)
 - [Known Bugs/Issues](#known-bugsissues)
 - [Related Resources](#related-resoirces)


## Introduction
	Hello my name is Amy Newland and I have 2 years of experience with Ruby on Rails, JavaScript, Docker, decent exposure to React. I am creating
	this application to become the next new Relic at New Relic. The interview process has been wonderful. I have really enjoy communicating with
	everyone and learning along the way and super excited to see what I will learn during my time at New Relic. I am excited to get to know the
	rest of the team. Thank you for you time.

## Objective
	Create a command line executable program that takes given text(s) and outputs list of first 100
	most common three word sequences in descending order. Ignoring punctuation, spacing, new-lines trailing hypens.

	* Example:
  - `“I love\nsandwiches.”` should be treated the same as `"(I LOVE SANDWICHES!!)"`).
  - Contractions shouldn't be changed into two words (eg. `can't` should not become `can t`).
  - Hyphens on line-endings can be treated as continuations OR punctuation.
  - Unicode may also be handled in any way you like (including replacing it with a space)

## Prerequisites
	- Minimum Ruby version 2.7.6
	- Docker for running docker commands but not required to run the app manually

## Installation
	# clone repository in your desired location locally.
		```https://github.com/Newland-A/amy-newland-coding-challenge.git```
	# cd amy-new-coding-challenge

	# Helpful tips
		* To output via csv file uncomment `require 'csv'` in word_sequence_finder.rb

## Running Application
	# Using $stdin
	` cat text(s)_file | ./wordsequencefinder.rb `
	# Using ARGV
	`ruby ./wordsequencefinder.rb text(s)_file.rb `

## Docker
	The extra credit Docker requirement was achieved by providing a Dockerfile that can be used for
	building a Docker image and running the app within a Docker container. I have included the two
	example texts 'moby-dick.txt and brothers-karamazov.txt under test_texts folder. Before running
	the following commands if there is other text you wish to run please add them to the test_texts
	folder. The text should be added before the image is built.

	** Make sure Docker is running locally
	* Build image using:
		`docker build -t amy-newland-code-challenge .`
	* Run using:
		- Will run test suite as well when running this command if require is uncommented at bottom of
			word_sequence_finder.rb
		`docker run -it amy-newland-code-challenge`

## Running Tests
	* Tests can be run manually by:
		- uncomment first line of `specs/word_sequence_finder_spec.rb`
		- then run `rspec specs/word_sequence_finder_spec.rb`
	* To run tests simutaneously with ARGV or $stdin commands uncomment last line of `word_sequence_finder.rb`
		- Then preferred command from section Running Application

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
	* Make out interesting to work with (colorization, seperation of file outputs)
	* Make application more secure in taking in input

## Known Bugs/Issues
  * When entering text either ARGV using file_name text_file_to_evaluate or stdin using
		`cat file_name or text | word_sequence_finder.rb`
		- No text argument terminal will stall use `ctrl + c` then enter commands with text argument
	* When urls are used `www.code-challenge.com or https://code-challenge.com` outputs
		`wwwcode-challengecom or httpscode-challengecom`

## Related Resources
	- https://ruby-doc.org/3.2.0/Hash.html#method-i-fetch
	- https://rubydoc.info/stdlib/core/Enumerable:each_cons
