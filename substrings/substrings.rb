# Implement a method #substrings that takes a word as the first argument
# and then an array of valid substrings (your dictionary) as the second
# argument. It should return a hash listing each substring (case insensitive)
# that was found in the original string and how many times it was found.

def substrings(sentence, substring_list)
  key_value_array = []
  
  keys(sentence, substring_list).each do |key_word|
    key_value_array.push([key_word, key_word_count(sentence, key_word)])
  end
  
  Hash[key_value_array]
end

def keys(template, match_array)
  match_array.select{ |word| template =~ /#{word}/i }
end

def key_word_count(template, key)
  template.scan(/#{key}/i).length
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low",
              "own","part","partner","sit"]

test_string_1 = "below"
test_string_2 = "Howdy partner, sit down! How's it going?"

if substrings(test_string_1, dictionary) == {"below"=>1, "low"=>1}
  puts true
else
  puts substrings(test_string_1, dictionary)
end

if substrings(test_string_2, dictionary) == {"down"=>1, "how"=>2, "howdy"=>1,
  "go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1, "part"=>1, "partner"=>1,
  "sit"=>1}
  puts true
else
  puts substrings(test_string_2, dictionary)
end
