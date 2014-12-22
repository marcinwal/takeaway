class Dish

  DISHES = {fish: 10.5, fries: 2.5, soup: 3.4}

  attr_reader :name,:price

  def initialize(name,price)
    @name = name
    @price = price
  end

  def self.method_missing name,*args
    return new name,DISHES[name] if DISHES[name]
    super
  end

end