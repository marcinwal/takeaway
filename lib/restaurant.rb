class Restaurant
  INITIAL = {fish: 20,fries: 40,soup: 30,desert: 30,pizza: 20,coffee: 50 }

  attr_reader :users, :menu, :orders

  def initialize
    @users = []
    @menu = []
    @orders = []
    init_menu
  end

  def check_menu(name)
    @menu.select{|d| d.name == name}.count
  end

  def init_menu
    INITIAL.each do |k,v|
      v.times {@menu << Dish.send(k)}
    end
  end

end