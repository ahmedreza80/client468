class ChargesController < ApplicationController
  require 'net/http'
  require 'rubygems'

  @@email  = 0
  @@amount = 0
  @@phone  = ''
  @@order_id = ''

  def index
    
  end

  def new
    @@amount    = params[:amount]
    @@email     = params[:email]
    @@phone     = params[:mobile_number]
    @@order_id  = params[:order_id]
  end

  def create
    charge= Charge.create(email: @@email, amount: @@amount, razorpay_payment_id: params[:razorpay_payment_id])
    charge.save
      if charge.present?
          # message = "Thanks for placing your order on Denny Dots, We have recived your order , and will contact you shortly! your order Tracking order number is #{@@order_id}"     # MESSAGE
        if @@phone.include? "+91"
        phone_number  = @@phone.slice! "+91"        
      else
        phone_number  = @@phone  #CONTACT NUMBER
      end
      if phone_number.size == 10
            # twilio_sms_send(phone_number,message)
            gupshup_sms(phone_number,@@order_id)
      end 
      end  
      # puts message  
      redirect_to  charges_path
  end
  # def twilio_sms_send(phone_number, message)
  #     require 'twilio-ruby'
  #     account_sid = 'AC6f5dabea5c2ac20d36e739f9dcf2e071'
  #     auth_token = '232e229751bc1b7ad4b3d9ae708fa012'
  #     @client = Twilio::REST::Client.new account_sid, auth_token
  #     @client.account.messages.create({from: '+15172012212 ', to: phone_number, body: message})
  #     # puts @client
  #     # puts phone_number
  #     # puts message
  # end
def gupshup_sms(phone_number,order)
  url = URI.parse("http://enterprise.smsgupshup.com/GatewayAPI/rest?msg=Thanks%20for%20placing%20your%20order%20on%20Denny%20Dots,%20We%20have%20recived%20your%20order%20,%20and%20will%20contact%20you%20shortly!%20your%20order%20Tracking%20order%20number%20is#{order}&v=1.1&userid=2000185939&password=Gp3Mtr&send_to=91#{phone_number}&msg_type=text&method=sendMessage")
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http|http.request(req)}
  puts res.body
end

end
