require 'byebug'

class Order
  attr_reader :order

  def initialize(dish,how_many)
    @order = {}
    @order[dish]=how_many
  end 
  #adding new order to existing one
  def add_new(dish,how_many)
    @order[dish] += how_many if @order.key?(dish)
    @order[dish]=how_many unless @order.key?(dish)
  end

  def items_sum
    return order.reduce(0) { |s,(k,v)| s += v }
  end
end