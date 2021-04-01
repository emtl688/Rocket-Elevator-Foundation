require 'ElevatorMedia'
require 'rails_helper'


describe ElevatorMedia::Streamer do
    describe 'getContent' do
        
        context 'Instance streamer' do
            streamer = ElevatorMedia::Streamer.new()

            it 'get random activity of the day' do
                x = streamer.getActivity()
                puts(x)
                expect(x).to be_a(String)
            end

            it 'get the activity type' do
                x = streamer.getActivityType()
                puts(x)
                expect(x).to be_a(String)
            end

            it 'return html' do
                x = streamer.returnHTML()
                expect(x).not_to be(nil)
                expect(x).to be_a(String)
                expect(x).to include("<html>")
                expect(x).to include("</html>")
                puts(x)
            end

                
        end
    end
end