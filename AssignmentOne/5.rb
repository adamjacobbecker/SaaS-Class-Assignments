class Class  
  
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # make sure it's a string
    attr_reader attr_name  # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter

    #class_eval "your code here, use %Q for multiline strings"
    class_eval %Q{
            
      def #{attr_name}=(x)
        @#{attr_name}_history = Array.new().push(nil) if !defined? @#{attr_name}_history
        @#{attr_name}_history.push(x)
      end
      
      define_method(attr_name + "_history") do
        return @#{attr_name}_history
      end
      
    }
    
  end
  
end

class Foo
  attr_accessor_with_history :bar
  attr_accessor_with_history :foobar
end

=begin
f = Foo.new
f.bar = 1
f.bar = 2
f = Foo.new
f.bar = 4
p f.bar_history
f.foobar = 9
p f.foobar_history
=end