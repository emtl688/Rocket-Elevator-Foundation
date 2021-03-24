require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

module RailsAdmin
  module Config
    module Actions
      class Starwars < RailsAdmin::Config::Actions::Base
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
          'starwars.html.erb'
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
              apikey: ENV["IBM_STARWARS_API"]
            )
            text_to_speech = TextToSpeechV1.new(
              authenticator: authenticator
            )
            quote1 = "Yoda is not a Muppet."
            quote2 = "Ewok was never spoken in the original trilogy.The word Ewok is never uttered by a character in the original trilogy. Although, the species is identified in the script and closing credits."
            quote3 = "Boba Fett's face is actually visible in the original movies.You may think you never see Boba Fett's face in the original trilogy, but the actor who played Fett, Jeremy Bulloch, did stand in for an Imperial officer at the last minute"
            quote4 = "I have a bad feeling about this became a running gag for the franchise.The phrase I have a bad feeling about this or I have a very bad feeling about this is said in every Star Wars movie"
            quote5 = "Return of the Jedi almost had a very different ending.In a story development session for Return of the Jedi, George Lucas toyed with the idea that after Luke removes dying Vader's helmet, he puts it on, proclaims Now I am Vader and turns to the dark side"

            random_quotes = [quote1, quote2, quote3, quote4, quote5].sample

            text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/c9e0f5e1-d276-4fd3-8cc4-fc8616591942"
            puts text_to_speech
            File.open("app/assets/audios/starwars.mp3" , "wb") do |audio_file|
              quotes = text_to_speech.synthesize(
                text: random_quotes,
                accept: "audio/mp3",
                voice: "en-US_MichaelV3Voice"
              ).result 
              puts quotes
            audio_file.write(quotes)
            end
          end
        end

      end
    end
  end
end
