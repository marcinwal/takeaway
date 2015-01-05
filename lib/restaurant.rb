require_relative 'twillio.rb'

class Restaurant
  INITIAL = {fish: 20,fries: 40,soup: 30,desert: 30,pizza: 20,coffee: 50 }
  PRICES ={fish: 9.0,fries: 2.20,soup: 4.4,desert: 3.99,pizza: 8.99, coffee: 1.99 }
  DELIVERY_TIME = 3600 #in seconds

  include Twillio

  attr_reader :users, :menu, :orders, :tel

  def initialize(tel = '+441793250218')
    @users = []
    @menu = {}
    @orders = []
    @tel = tel
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
    now += DELIVERY_TIME
    reduce_menu(order)
    twillio_msg(@tel,user.tel,"Thank you! Your order was placed and will be \ 
      delivered before #{now.hour}:#{now.min} for #{'%.2f' % bill(order)} GBP") if confo
  end

  def reduce_menu(order)
    order.order.each do |name,quant|
      raise "#{name} is not on the menu" unless menu.key?(name)
      raise "#{name} is gone" if menu[name] < quant #should send a message to the user ..
      menu[name] -= quant
    end
  end

  def order_sum_correct(order,sum)
    raise "Wrong check sum " if sum!=order.items_sum
  end


  def bill(order)
    order.order.reduce(0){|sum,(k,v)| sum += v * PRICES[k]}
  end

end