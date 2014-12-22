require 'user'

describe 'user' do
  let(:user){User.new('marcin','999')}
  it 'should create the user with name and tel' do
    expect(user.tel).to eq('999')
  end

end