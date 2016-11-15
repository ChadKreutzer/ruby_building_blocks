# Implement a method #substrings that takes a word as the first argument
# and then an array of valid substrings (your dictionary) as the second
# argument. It should return a hash listing each substring (case insensitive)
# that was found in the original string and how many times it was found.

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(sentence, substring_list)
  match_array = []
  match_hash = Hash.new(0)
  substring_list.each do |s|
    # if sentence.scan(/#{s}/i) != []
    #   match_hash[s] += 1
    # end
    match_array.push(sentence.scan(/#{s}/i))
  end
  # match_hash
  match_array.uniq
end

# if substrings("below", dictionary) == {"below"=>1, "low"=>1}
#   puts true
# else
#   puts substrings("below", dictionary)
# end

if substrings("Howdy partner, sit down! How's it going?", dictionary) == {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
  puts true
else
  puts substrings("Howdy partner, sit down! How's it going?", dictionary)
end
