require 'byebug'

class Order
  attr_reader :order

  def initialize(positions,id)
    #byebug
    @order = {}
    @order.merge!(positions)
    @order.merge!({id: id})
  end 
  #adding new order to existing one
  def add_new(positions)
    @order.merge!(positions)
  end
end