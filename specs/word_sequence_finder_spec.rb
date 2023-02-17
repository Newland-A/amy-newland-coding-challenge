# Uncomment this line to run the specs manually
# require_relative '../word_sequence_finder.rb'
# require 'uri'
# require 'pry'
require 'test/unit'

class WordSequenceFinderTest < Test::Unit::TestCase
  def test_ignore_punctuation
    input = "### ` ( I, love\n coding. ) !!! *** @ &&& $$$ %%% +++ === ;;;"
    expected_output = [["i love coding", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_ignore_case
    input = "I Love Coding!, I LOVE HORSES!, I lOvE cAmPiNg!"
    expected_output = [["i love coding", 1],
                       ["love coding i", 1],
                       ["coding i love", 1],
                       ["i love horses", 1],
                       ["love horses i", 1],
                       ["horses i love", 1],
                       ["i love camping", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_ignore_apostrophes
    input = "I can't love' sandwich's."
    expected_output = [["i can't love'", 1], ["can't love' sandwich's", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_handle_hyphens
    input = "I love-to eat\nsand-\nwiches."
    expected_output = [["i love-to eat", 1], ["love-to eat sandwiches", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_handle_urls_and_emails
    input = "test-example@newrelic.com and I love http://coding-challenge.com"
    expected_output = [["test-examplenewreliccom and i", 1],
                       ["and i love", 1],
                       ["i love httpcoding-challengecom", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_handle_blank_text
    input = ""
    expected_output = []
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_order_of_output
    input = "I Love Coding! I can't love sandwiches. I Love outdoors! I can't love sand-\nwiches. I can't love!"
    expected_output = [["i can't love", 3],
                       ["can't love sandwiches", 2],
                       ["love sandwiches i", 2],
                       ["i love coding", 1],
                       ["love coding i", 1],
                       ["coding i can't", 1],
                       ["sandwiches i love", 1],
                       ["i love outdoors", 1],
                       ["love outdoors i", 1],
                       ["outdoors i can't", 1],
                       ["sandwiches i can't", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_code_removal
    input = "<code> <h1> 'Help this program' </h1> </code>"
    expected_output = [["code h 'help", 1],
                       ["h 'help this", 1],
                       ["'help this program'", 1],
                       ["this program' h", 1],
                       ["program' h code", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_encoding
    # test string has "NON_ASCII" characters and replaces them with a space
    input = "I love-to code 世界 and ʎǝʞıןɐ testing expected out-\ncomes!"
    expected_output = [["i love-to code", 1],
                       ["love-to code and", 1],
                       ["code and testing", 1],
                       ["and testing expected", 1],
                       ["testing expected outcomes", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end

  def test_malicious_attack
    # Possibly not needed test if double quotes is added to punctuation test,
    # however, makes sure common attack sequence is not accepted as valid input
    input = 'this string is malicous foo bar"; system("rm -rf /")'
    expected_output = [["this string is", 1],
                       ["string is malicous", 1],
                       ["is malicous foo", 1],
                       ["malicous foo bar", 1],
                       ["foo bar systemrm", 1],
                       ["bar systemrm -rf", 1]]
    assert_equal expected_output, WordSequenceFinder.new(input).most_common_sequences
  end
end
