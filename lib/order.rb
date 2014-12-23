require 'byebug'

class Order
  attr_reader :order

  def initialize(positions,id)
    #byebug
    @order = {}
    @order.merge!(positions)
    @order.merge!({id: id})
  end 
end