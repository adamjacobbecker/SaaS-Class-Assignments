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

module Enumerable
  def palindrome?
    if self.any?
      true if self.to_s.downcase.gsub(/\W/, '') == self.to_s.reverse.downcase.gsub(/\W/, '')
    else
      false
    end
  end
end

#p "ooo".palindrome?
#p "foo".palindrome?

#p [1,2,3,2,1].palindrome?
#p [1,2,3,2,2].palindrome?

#hash = Hash.new(['1' => 'blah', '2' => 'bro'])
#p hash.palindrome?
