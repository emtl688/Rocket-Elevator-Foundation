class InterventionsController < ApplicationController
    def index
    end

    def new
        @intervention = Intervention.new
    end

    # POST /interventions or /interventions.json
    def create
        #===================================================================================================
        # PRINTS PARAMS INTO TERMINAL WINDOW
        #===================================================================================================
    
        puts "===========START================"
        puts params
        puts "=============END================"

        #===================================================================================================
        # SETUP VARIABLES BELOW
        #===================================================================================================

        customer_id = params["customer_id"]
        building_id = params["building_id"]
        battery_id = params["battery_id"]
        column_id = params["column_id"]
        elevator_id = params["elevator_id"]
        employee_id = params["employee_id"]
        description = params["description"]
      
        
        @intervention = Intervention.new(intervention_params)
        
         
        @intervention.customer_id = customer_id
        @intervention.building_id = building_id
        @intervention.battery_id = battery_id
        @intervention.column_id = column_id
        @intervention.elevator_id = elevator_id
        @intervention.employee_id = employee_id
        @intervention.report = description

        @intervention.save!

        if @quote.save
            redirect_back fallback_location: root_path, notice: "Your Intervention was successfully created and sent!"
        end

    end

    def intervention_params
        params.require(:intervention).permit(:customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :description)
    end


end
