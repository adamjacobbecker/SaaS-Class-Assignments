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