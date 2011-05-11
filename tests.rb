

@words = %w{bat tab fat cat battle table}

class String
  def sort
    self.split(//).sort.join("")
  end
end

def pattern_test(regex)
  regex = Regexp.new(regex)
  new_words = @words.select {|word|  regex === word}

  puts ""
  puts "regex: " + regex.source
  puts "words: " + new_words.join(" ")
end

# pattern test
# puts "words: " + @words.join(" ")
# pattern_test("tab..")
# pattern_test("^t.+e$")
# pattern_test("^t\w+")


# LETTERS TEST is the traditional test to see if a bag of letters can be used to form a word
# it first comes up with uniq sorted list of characters and then builds a regex based on it.

def letters_test(letters)

  good_letters = letters.sort.split(//).uniq
  regex = good_letters.map {|letter| "#{letter}{0,#{letters.count(letter)}}" }
  regex = Regexp.new("^#{regex.join}$")
  new_words = @words.select {|word| regex === word.sort}

  puts ""
  puts "regex: " + regex.source
  puts "words: " + new_words.join(" ")
end

# letters_test("batsaa")


# LETTERS + PATTERN test
# read in the pattern and create a regex based on it and add the pattern chars to the bag of chars
# then build two lists of possible words and take the set intersection between the lists

# b__b    => ^b..$
# b*      => ^b.*$
# *b      => ^.*b$
# *b__c*  => ^.*b..c.*$

def build_pattern_test(pattern)
  regex = "^"
  pattern.each_char do |letter|
    case letter
    when /[a-z]/
      regex += letter
    when /_/
      regex += "."
    when /\*/
      regex += ".*"
    end
  end
  regex += "$"

  puts ""
  puts "pattern: " + pattern
  puts "regex:   " + regex

  return regex
end


build_pattern_test("b__b")
build_pattern_test("b*")
build_pattern_test("*b")
build_pattern_test("*b__c*")

p = build_pattern_test"*b*l*"
pattern_test(p)





