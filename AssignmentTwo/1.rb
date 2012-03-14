class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * (@@currencies[singular_currency] / @@currencies['dollar'])
    elsif method_id.to_s == 'in'
      singular_currency = args[0].to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
        self * (@@currencies['dollar'] / @@currencies[singular_currency])
      end
    else
      super
    end
  end
end

#p 12.euros.in(:dollars)
#p 12.yen
#p 12.euro.in(:dollar)
#p 12.rupees.in(:dollar)
#p 12.rupee

class String
  def palindrome?
    true if self.downcase.gsub(/\W/, '') == self.reverse.downcase.gsub(/\W/, '')
  end
end

module Enumerable
  def palindrome?
    self.collect{|x| x} == self.collect{|x| x}.reverse
  end
end

#p "ooo".palindrome?
#p "foo".palindrome?

#p [1,2,3,2,1].palindrome?
#p [1,2,3,2,2].palindrome?
