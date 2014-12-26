require 'restaurant.rb'

describe 'restaurant' do

  let(:restaurant){Restaurant.new}
  let(:user){double :user}
  let(:order){double :order,items_sum: 2}
  let(:order_2){double :order_2,items_sum: 3}
  it 'should have some dishes initially' do
    expect(restaurant.check_menu(:fish)).to eq(20)
  end

  it 'should be possible to order' do
    restaurant.order(user,order,2)
  end  

  it 'should raise the error if items do not match' do
    expect {restaurant.order(user,order_2,2)}.to raise_error(RuntimeError,"Wrong check sum ")
  end

  

end

