require 'open_weather'

module RailsAdmin
  module Config
    module Actions
      class Map < RailsAdmin::Config::Actions::Base
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
          'map.html.erb'
        end

        register_instance_option :link_icon do
          'icon-map-marker'
        end

        register_instance_option :statistics? do
          false
        end


        register_instance_option :controller do
          proc do
            @data_recolector = []

            Building.all.each do |building|
              data = []

              data[0] = building.address.latitude
              data[1] = building.address.longitude

              address = "#{building.address.number_and_street}, #{building.address.city}, #{building.address.postal_code}, #{building.address.country}"
              amount_columns = 0
              amount_elevators = 0

              options = { units: "metric", APPID: ENV['OPEN_WEATHER_API'] }
              weather = OpenWeather::Current.geocode(data[0], data[1] , options)

              temp = weather.dig("main", "temp")
              feels_like = weather.dig("main", "feels_like")
              
              info = "<br><b>Address:</b><FONT color='#941001'> #{building.address.number_and_street}, #{building.address.city}, #{building.address.postal_code},</FONT>"	

              building.building_details.each do |building_detail|
                if building_detail.information_key == "Number of Floors"
                  info += "<br><b>Number of Floors:</b> #{building_detail.value}"
                end
              end

              info += "<br><b>Company Name:</b><FONT color='#073254'> #{building.customer.company_name}</FONT>"
              info += "<br><b>Number of Batteries:</b> #{building.batteries.count}"
              
              building.batteries.each do |battery|
                amount_columns += battery.columns.count      
                battery.columns.each do |column|
                  amount_elevators += column.elevators.count      
                end
              end
              
              info += "<br><b>Number of Columns:</b> #{amount_columns}"   
              info += "<br><b>Number of Elevators:</b> #{amount_elevators}"   
              info += "<br><b>Technical contact:</b> #{building.full_name_of_the_technical_contact_for_the_building}"
              info += "<br><b>Current weather:</b> #{temp}°C, feels like #{feels_like}°C"

              data[2] = info
              @data_recolector << data
            end
          end
        end
      end
    end
  end
end