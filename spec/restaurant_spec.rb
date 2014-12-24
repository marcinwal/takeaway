require 'restaurant.rb'

describe 'restaurant' do

  let(:restaurant){Restaurant.new}
  let(:user){double :user}
  let(:order){double :order}
  it 'should have some dishes initially' do
    expect(restaurant.check_menu(:fish)).to eq(20)
  end

  it 'should be possible to order' do
    restaurant.order(user,order,2)
  end  


end

