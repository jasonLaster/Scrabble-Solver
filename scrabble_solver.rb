
dict = File.open("clean_dict.txt", "r").read.split(/ /).map(&:upcase)
# words = %w{bat tab fat cat battle table}
# words.map!(&:upcase)

class String
  def sort
    self.split(//).sort.join("")
  end
end

def pattern_match(words, regex)
  regex = Regexp.new(regex)
  words.select {|word|  regex === word}
end

def letters_match(words, letters)
  good_letters = letters.sort.split(//).uniq
  regex = good_letters.map {|letter| "#{letter}{0,#{letters.count(letter)}}" }
  regex = Regexp.new("^#{regex.join}$")
  words.select {|word| regex === word.sort}
end

def regex_match(words, regex)
  regex = Regexp.new("^#{regex}$")
  words.select {|word| regex === word}
end

def build_pattern(pattern, regex = "")
  pattern.each_char do |letter|
    regex +=
      case letter
        when /[A-Z]/ then letter
        when /_/ then "."
        when /\*/ then ".*"
        else "&"
      end
  end
  regex
end

def intersection(l1, l2)
  l1 & l2
end

def update_letters(pattern, letters)
  letters += pattern.scan(/[A-Z]/).join
end
class Array
  def display
    self.map(&:capitalize).join(" ")
  end
end

# read in parameters
pattern, letters = nil, nil
if ARGV.length == 2
  pattern = ARGV[1].upcase
  letters = update_letters(pattern, ARGV[0].upcase)
else
  letters = ARGV[0].upcase
end

if pattern.nil?
  puts letters_match(dict, letters).display
else
  m1 = letters_match(dict, letters)
  r1 = build_pattern(pattern)
  m2 = regex_match(dict, r1)
  m3 = intersection(m1, m2)
  puts m3.display
end
