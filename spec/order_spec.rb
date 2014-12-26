require 'order'

describe 'order to restaurant' do

  let(:o){Order.new(:fish,1)}
  it 'should add the orders' do
    expect(o.order[:fish]).to eq(1)
  end  
  it 'should add new orders' do
    o.add_new(:fries,1)
    expect(o.order[:fries]).to eq(1)
  end

  it 'should have 4 items' do
    o.add_new(:fish,3)
    expect(o.items_sum).to eq(4)
  end
end