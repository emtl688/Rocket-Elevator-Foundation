
# require './lib/tasks/send_sms.rb'
require 'twilio-ruby'
require 'slack-notifier'

class Elevator < ApplicationRecord
    belongs_to :column
    after_update :send_sms
    around_update :elevator_status_is_changed

    #Call method 'message' when an elevator status changes to 'intervention'
    def send_sms
        status = self.status
        if status.upcase == 'INTERVENTION'
           self.message
        end
    end

    #Send a Message to Elevators maintenance guy
    def message
        account_sid = ENV['TWILIO_ACCOUNT_SID'] 
        auth_token = ENV['TWILIO_AUTH_TOKEN'] 
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV['TWILIO_PHONE_NUMBER']
        to = '+15145037764' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "The Elevator '#{self.id}', Serial Number '#{self.serial_number}' needs an intervention" 
        )
    end

    around_update :elevator_status_is_changed
    private
    def elevator_status_is_changed
        notify = self.status_changed?
        if notify
            notifier = Slack::Notifier.new ENV['SLACK_API_TOKEN']
            notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
            notifier.ping "The elevator '#{self.id} with Serial Number '#{self.serial_number} changed status from '#{self.status_was} to '#{self.status}" 
        end
        yield
    end
end
