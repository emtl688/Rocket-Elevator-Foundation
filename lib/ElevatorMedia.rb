require 'httparty'

module ElevatorMedia

    class Streamer

        def initialize

            @randomActivityAPI = HTTParty.get('https://www.boredapi.com/api/activity')
            @suggestedActivity = self.getActivity()
            @activityType = self.getActivityType()

        end

        def returnHTML()
            activity = self.getActivity()
            activityType = self.getActivityType()
            html = "<html>
                        <body>
                            <div class='activity'>
                                <h3>Why not try something new today?</h3>
                                    Activity: #{activity}
                                    Type of Activity: #{activityType}
                            </div>
                        </body>
                    </html>"
            return html
        end
            

        def getActivity()
            JSON.parse(@randomActivityAPI.body)["activity"]
        end

        def getActivityType()
            JSON.parse(@randomActivityAPI.body)["type"]
        end
    end
end