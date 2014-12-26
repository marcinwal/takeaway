require 'rubygems'
require 'twilio-ruby'



module Twillio
  PATH = './lib/pass_twilio.md'

  def init_twilio
    passes = load_passes(PATH)
    @client = Twilio::REST::Client.new passes[:account_sid],passes[:auth_token]
  end

  def load_passes(path)
    res = {}
    File.open(path,'r') do |file|
      file.each_line do |line|
        line = line.split(':')
        res[line[0].to_sym]=line[1].chomp
      end  
    end
    return res
  end

  def load_passes2(path)
    return Hash[*File.read(PATH).split(/[: \n]+/)]
  end

  def twillio_msg(num1,num2,text)
    @client.account.messages.create(from: num1,to: num2,body: text)
  end
end