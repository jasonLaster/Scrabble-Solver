TYPE = :normal
b = "a"
e = "x"
m = "d"


# define sort alphabetically method for words
class String
  def sort
    self.split(//).sort.join("")
  end
end


# read in collection of letters
letters = ARGV[0].downcase
sorted_letters = letters.sort


# READ in dictionary
dict = File.open("clean_dict.txt", "r").read.split(/ /)
dict = dict.take_while {|word| word.length < letters.length}



good_letters = sorted_letters.split(//).uniq
bad_letters = "abcdefghijklmnopqrstuvwxyz".split(//).delete_if {|l| good_letters.any? {|gl| gl == l }}

regex = good_letters.map {|letter| "#{letter}{0,#{letters.count(letter)}}" }
regex = "^#{regex.join}$"

case TYPE
when :normal
  words = dict.select {|word| word.sort.downcase.match(regex) != nil }
when :beginning
  l = b.length
  words = dict.select do |word|
    (word[0..l-1].downcase == b) &&
    (word[l..-1].sort.downcase.match(regex) != nil)
  end
when :ending
  l = b.length
  words = dict.select do |word|
    wl = word.length - l
    (word[wl..-1].downcase == e) &&
    (word[0..wl-1].sort.downcase.match(regex) != nil)
  end
end


# only consider a certain length word
# LENGTH = 6
# words = words.select {|word| word.length == LENGTH}

# uses a certain letter
# LETTER = "x"
# words = words.select {|word| word.match(LETTER) != nil}


puts letters
puts regex
puts words.map {|word| "#{word}"}.join(" ")
