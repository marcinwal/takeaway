require 'restaurant.rb'

describe 'restaurant' do

  let(:restaurant){Restaurant.new}
  it 'should have some dishes initially' do
    expect(restaurant.check_menu(:fish)).to eq(20)
  end


end
