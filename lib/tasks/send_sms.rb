# require 'twilio-ruby'
# class Sendsms

#         def initialized
#             self.send_sms
#         end

        # def send_sms
        #     account_sid = ENV['TWILIO_ACCOUNT_SID'] 
        #     auth_token = ENV['TWILIO_AUTH_TOKEN'] 
        #     client = Twilio::REST::Client.new(account_sid, auth_token)

        #     from = '+18198030185'
        #     # from = ENV['TWILIO_PHONE_NUMBER']
        #     to = '+18195311787' # Your mobile phone number

        #     client.messages.create(
        #     from: from,
        #     to: to,
        #     body: "MORNING TEST"
        #     body: "The Elevator '#{elevator.id}', Serial Number '#{elevator.serial_number}' needs an intervention" 
        #     )
         # end
# end