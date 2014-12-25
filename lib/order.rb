require 'byebug'

class Order
  attr_reader :order

  def initialize(id,positions)
    @order = {}
    @order.merge!({id: id})
    @order.merge!(positions)
  end 
  #adding new order to existing one
  def add_new(positions)
    @order.merge!(positions)
  end

  def items_sum
    return order.reduce(-order[:id]) { |s,(k,v)| s += v }
  end

end