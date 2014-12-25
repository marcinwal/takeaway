require 'byebug'

class Order
  attr_reader :order

  def initialize(positions,id)
    #byebug
    @order = {}
    @order.merge!({id: id})
    @order.merge!(positions)
  end 
  #adding new order to existing one
  def add_new(positions)
    @order.merge!(positions)
  end

  def items_sum
    # sum = 0
    # order.each {|k,v| sum += v unless k == :id}
    # return sum
    #special id of the order
    return order.reduce(-order[:id]) { |s,(k,v)| s += v }
  end

end