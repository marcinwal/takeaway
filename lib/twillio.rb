require 'rubygems'
require 'twilio-ruby'



module Twillio
  def init
    account_sid = 'AC47ed93927854053e432b8b356208f4ee'
    auth_token = '345019015c1527d9982424277e39bbc1'
    @client = Twillio::REST::Clinet.new account_sid,auth_token

  end

  def twillio_msg(num1,num2,text)
    @client.account.messages.create(from: num1,to: num2,body: text)
  end
end