def count_words(string)
  word_count = Hash.new(0)
  input_words = string.downcase.scan(/\w+/)
  input_words.each {|x| word_count[x] += 1 }
  return word_count
end

# p count_words("Adam adam ADAM mada mada mad")