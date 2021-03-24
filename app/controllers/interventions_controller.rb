class InterventionsController < ApplicationController
    def index
    end

    def new
        @intervention = Intervention.new
    end

    # POST /interventions or /interventions.json
    def create
        @intervention = Intervention.new()
        
        @intervention.author_id = Employee.find_by(user_id: current_user.id).id 
        @intervention.customer_id = intervention_params[:customer]
        @intervention.building_id = intervention_params[:building]
        @intervention.battery_id = intervention_params[:battery]
        @intervention.column_id = intervention_params[:column]
        @intervention.elevator_id = intervention_params[:elevator]
        @intervention.employee_id = intervention_params[:employee]
        @intervention.report = intervention_params[:report]

        @intervention.save!

        if @intervention.save
            redirect_back fallback_location: root_path, notice: "Your Intervention was successfully created and sent!"
        end

    end

    def intervention_params
        params.require(:interventions).permit( :customer, :building, :battery, :column, :elevator, :employee, :result, :report, :status)
    end


end
