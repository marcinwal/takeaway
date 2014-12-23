require 'byebug'

class Order
  attr_reader :order

  def initialize(positions)
    #byebug
    @order = {}
    @order.merge!(positions)
  end 
end