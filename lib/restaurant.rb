require 'twillio.rb'

class Restaurant
  INITIAL = {fish: 20,fries: 40,soup: 30,desert: 30,pizza: 20,coffee: 50 }

  include Twillio

  attr_reader :users, :menu, :orders, :tel

  def initialize
    @users = []
    @menu = []
    @orders = []
    @tel = '999'
    init_menu
    init_twilio
  end

  def check_menu(name)
    @menu.select{|d| d.name == name}.count
  end

  def init_menu
    INITIAL.each do |k,v|
      v.times {@menu << Dish.send(k)}
    end
  end

  def order(user,order,sum,confo = false)
    order_sum_correct(order,sum)
    @users << user unless @users.include?(user)
    @orders << [order,user]
    twillio_msg(@tel,user.tel,"Thank you!") if confo
  end

  def order_sum_correct(order,sum)
    raise "Wrong check sum " if sum!=order.items_sum
  end

  def bill(order)
  end  


end