TYPE = :normal
b = ""

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

regex = good_letters.map {|letter|  "#{letter}{0,#{letters.count(letter)}}" }
regex = "^#{regex.join}$"

case TYPE
when :normal
  words = dict.select {|word| word.sort.downcase.match(regex) != nil }
when :beginning
  l = b.length
  words = dict.select {|word| (word[0..l-1].downcase == b) && (word[l..-1].sort.downcase.match(regex) != nil) }
end


puts letters
puts regex
puts words.map {|word| "#{word}"}#.select {|word| word.length == 6}.join(" ")
