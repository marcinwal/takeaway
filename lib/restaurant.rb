require_relative 'twillio.rb'

class Restaurant
  INITIAL = {fish: 20,fries: 40,soup: 30,desert: 30,pizza: 20,coffee: 50 }
  PRICES ={fish: 9.0,fries: 2.20,soup: 4.4,desert: 3.99,pizza: 8.99, coffee: 1.99 }
  DELIVERY_TIME = 3600 #in seconds

  include Twillio

  attr_reader :users, :menu, :orders, :tel

  def initialize()
    @users = []
    @menu = {}
    @orders = []
    @tel = '+441793250218'
    init_menu
    init_twilio
  end

  def check_menu(name)
    @menu[name]
  end

  def init_menu
    INITIAL.each do |k,v|
      #v.times {@menu << Dish.send(k)}
      @menu[k] = v
    end
  end

  def order(user,order,sum,confo = false)
    order_sum_correct(order,sum)
    @users << user unless @users.include?(user)
    now = Time.now
    @orders << [order,user,now]
    twillio_msg(@tel,user.tel,"Thank you! Your order was placed and will be \ 
      delivered before #{now + DELIVERY_TIME}") if confo
  end

  def order_sum_correct(order,sum)
    raise "Wrong check sum " if sum!=order.items_sum
  end


  def bill(order)
    order.order.reduce(0){|sum,(k,v)| sum += v * PRICES[k]}
  end

end