require 'order'

describe 'order to restaurant' do

  let(:order){Order.new({fish: 2,coffee: 2})}
  it 'should send the order to the restaurant'do
    expect(order.order[:fish]).to eq(2)
  end  
end