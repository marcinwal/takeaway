require_relative 'twillio.rb'

class Restaurant
  INITIAL = {fish: 20,fries: 40,soup: 30,desert: 30,pizza: 20,coffee: 50 }
  PRICES ={fish: 9.0,fries: 2.20,soup: 4.4,desert: 3.99,pizza: 8.99, coffee: 1.99 }
  DELIVERY_TIME = 3600 #in seconds

  include Twillio

  attr_reader :users,:orders

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

  def add_user(user)
    @users << user unless @users.include?(user)
  end

  def add_order(order,user,time)
    @orders << [order,user,time] # add to order maybe
  end  

  def take_time()
    return Time.now + DELIVERY_TIME
  end  

  def order(user,order,sum,confo = false)
    order_sum_correct(order,sum) # to split
    add_user(user)
    delivery= take_time
    add_order(order,user,delivery)
    reduce_menu(order)
    twillio_msg_time(@tel,user.tel,delivery,bill(order)) if confo
  end

  def reduce_menu(item)  #items 
    item.order.each do |name,quant|
      raise "#{name} is not on the menu" unless @menu.key?(name)
      raise "#{name} is gone" if @menu[name] < quant #should send a message to the user ..
      @menu[name] -= quant
    end
  end

  def order_sum_correct(order,sum)
    raise "Wrong check sum " if sum!=order.items_sum
  end


  def bill(order)
    order.order.reduce(0){|sum,(k,v)| sum += v * PRICES[k]}
  end

end