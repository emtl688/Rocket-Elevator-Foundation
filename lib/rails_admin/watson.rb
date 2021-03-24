require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

module RailsAdmin
  module Config
    module Actions
      class Watson < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end
        
        register_instance_option :breadcrumb_parent do
          nil
        end
        
        register_instance_option :auditing_versions_limit do
          100
        end

        register_instance_option :route_fragment do
          'watson.html.erb'
        end

        register_instance_option :link_icon do
          'icon-check'
        end

        register_instance_option :statistics? do
          false
        end


        register_instance_option :controller do
          proc do
            authenticator = Authenticators::IamAuthenticator.new(
              apikey: ENV["IBM_WATSON_API"]
            )
            text_to_speech = TextToSpeechV1.new(
              authenticator: authenticator
            )
            text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/280f7f27-71bb-4a6f-b3e0-749fcbebdeba"
            puts text_to_speech
            employee = Employee.find_by(user_id: current_user.id)
            File.open("app/assets/audios/watson.mp3", "wb") do |audio_file|
              response = text_to_speech.synthesize(
                text: "Greetings #{employee.first_name} #{employee.last_name}.
                  There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers.
                  Currently, there are #{Elevator.where(status: 'Intervention').count} not in running status and are being serviced. You currently have #{Quote.count} quotes awaiting processing.
                  You currently have #{Lead.count} leads in your contact requests.
                  #{Battery.count} batteries are deployed across #{Address.where(id: Building.select(:address_id).distinct).select(:city).distinct.count}cities.",
                accept: "audio/mp3",
                voice: "en-US_AllisonV3Voice"
              ).result 
              puts response
            audio_file.write(response)
            end
          end
        end

      end
    end
  end
end