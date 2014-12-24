require 'order'

describe 'order to restaurant' do

  let(:o){Order.new({fish: 2,coffee: 2},1)}
  it 'should add the orders' do
    expect(o.order[:fish]).to eq(2)
  end  
  it 'should add new orders' do
    o.add_new({fries: 2, elephant: 1})
    expect(o.order[:elephant]).to eq(1)
  end

  it 'should have 4 items' do
    expect(o.items_sum).to eq(4)
  end
end