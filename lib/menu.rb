class Menu
  INITIAL = [{name: :fish,quant: 20, price: 9.99},{name: :fries,quant: 50, price: 1.99},{name: :pizza,quant: 10, price: 9.99}]

  attr_reader :menu
  def initialize(menu = INITIAL)
    @menu = menu
  end


end
