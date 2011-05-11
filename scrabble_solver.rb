
class String
  def sort
    self.split(//).sort.join("")
  end
end

def read_in_dict(letters)
  # words = %w{bat tab fat cat battle table}
  words = File.open("small_dict.txt", "r").read.split(/ /)
  words += File.open("big_dict.txt", "r").read.split(/ /) if letters.length >= 10
  words
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
        when /[a-zA-Z]/ then letter
        when /_/ then "."
        when /\*/ then ".*"
        else
          raise SyntaxError, "bad character: #{letter}"
      end
  end
  regex
end

def update_letters(pattern, letters)
  letters += pattern.nil? ? "" : pattern.scan(/[A-Z]/).join
end

# read in parameters
pattern = (ARGV.length == 2) ? ARGV[1] : nil
letters = update_letters(pattern, ARGV[0])
dict = read_in_dict(letters)

m1 = letters_match(dict, letters)

if pattern.nil?
  puts m1.map(&:capitalize).join(" ")
else
  r1 = build_pattern(pattern)
  m2 = regex_match(dict, r1)
  m3 = m1 & m2
  puts m3.map(&:capitalize).join(" ")
end
