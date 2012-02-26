def palindrome?(string)
  if string.downcase.gsub(/\W/, '') == string.reverse.downcase.gsub(/\W/, '')
    return true
  end
end

String.class_eval do
  def palindrome?
    return true if self.downcase.gsub(/\W/, '') == self.reverse.downcase.gsub(/\W/, '')
  end
end

# p "Adam".palindrome?
# p "Madam, I'm Adam!".palindrome?

def count_words(string)
  word_count = Hash.new(0)
  input_words = string.downcase.scan(/\w+/)
  input_words.each {|x| word_count[x] += 1 }
  return word_count
end

# p count_words("Adam adam ADAM mada mada mad")