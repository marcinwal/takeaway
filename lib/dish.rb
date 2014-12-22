class Dish

  DISHES = {fish: 10.5, fries: 2.5, soup: 3.4,desert: 3.99,pizza: 7.99,
            coffee: 1.99}

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