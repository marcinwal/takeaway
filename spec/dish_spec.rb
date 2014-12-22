require 'dish'

describe 'dish' do 

  dish = Dish.new('salmon',15.3)

  it 'should be able to create a dish' do
    expect(dish.name).to eq('salmon')
  end  

  it 'should create a fish dish' do
    expect(Dish.fish.price).to eq(10.5)
  end
  
end