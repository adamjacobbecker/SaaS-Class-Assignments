class Dessert
  
  attr :name, true
  attr :calories, true
    
  def initialize(name, calories)
    self.name = name
    self.calories = calories
  end
  
  def healthy?
    if self.calories < 200
      true
    else
      false
    end
  end
  
  def delicious?
    return true
  end
  
end


class JellyBean < Dessert
  
  attr :flavor, true
  
  def initialize(name, calories, flavor)
    self.flavor = flavor
    super(name, calories)
  end
  
  def delicious?
    if flavor.downcase == "black licorice"
      false
    else
      true
    end
  end
  
end

# dessert = Dessert.new('ada',200)
# p dessert.healthy?
# p dessert.delicious?
#
# jellybean = JellyBean.new("black", 10, "black licaorice")
# p jellybean.healthy?
# p jellybean.delicious?
