require 'restaurant.rb'
require 'order.rb'
describe 'restaurant' do

  let(:restaurant){Restaurant.new()}
  let(:user){double :user,tel: '999'}
  let(:order){double :order,items_sum: 2}
  let(:order_2){double :order_2,items_sum: 3}
  it 'should have some dishes initially' do
    expect(restaurant.check_menu(:fish)).to eq(20)
  end

  it 'should be possible to order' do
    ord = Order.new(:fish,2)
    restaurant.order(user,ord,2)
  end  

  it 'should raise the error if items do not match' do
    expect {restaurant.order(user,order_2,2)}.to raise_error(RuntimeError,"Wrong check sum ")
  end

  it 'should calculate the price' do 
    ord = Order.new(:fish,2)
    ord.add_new(:coffee,4)
    restaurant.order(user,ord,6)
    expect(restaurant.bill(ord)).to eq(25.96)
  end  

  it 'should raise the error if food is not on the menu' do 
    ord = Order.new(:buraki,1)
    expect{restaurant.order(user,ord,1)}.to raise_error(RuntimeError,"buraki is not on the menu")
  end

  it 'should send a message' do
    ord = Order.new(:fish,2)
    allow(restaurant).to receive(:twillio_msg_time).and_return(true)
    expect(restaurant.order(user,ord,2,true)).to eq(true)
  end


end

