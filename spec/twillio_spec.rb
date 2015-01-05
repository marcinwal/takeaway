require 'twillio'

class Twillio_test; include Twillio; end

describe 'twillio' do 
  let(:twillio){Twillio_test.new}
  it 'shuld load the passwords' do 
    twillio.init_twilio
    expect(twillio.load_passes2('./lib/pass_twilio.md').size).to eq(2)
  end

end



# add allow for twillio checks   if they are ok
#test all the mtethods

