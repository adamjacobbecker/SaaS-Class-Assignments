class CartesianProduct
  include Enumerable

  def initialize(xvals, yvals = [])
    @results = []
    
    xvals.each do |x|
      yvals.each do |y|
        @results.push([x,y])
      end
    end
    
  end
  
  def each
    @results.each do |result|
      yield(result)
    end
  end
end
 
#c = CartesianProduct.new([:b,:a], [4])
#c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
 
#c = CartesianProduct.new([:a,:b], [])
#c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)