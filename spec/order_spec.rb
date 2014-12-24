require 'order'

describe 'order to restaurant' do

  let(:o){Order.new({fish: 2,coffee: 2},1)}
  it 'should sadd the orders' do
    expect(o.order[:fish]).to eq(2)
  end  
  it 'should add new orders' do
    expect((o.add_new({fires: 2})).order[:fires]).to eq(2)
  end
end