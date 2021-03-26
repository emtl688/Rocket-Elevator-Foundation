class InterventionsController < ApplicationController
    def index
    end

    def new
        @intervention = Intervention.new
    end

    require 'zendesk_api'

    def zendesk_intervention_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_INT_URL']
            config.username = ENV['ZENDESK_INT_USERNAME']
            config.token = ENV['ZENDESK_INT_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
        :subject => "New intervention request!",
        :comment => {
            :value => 
            "
            Customer: #{@intervention.customer.company_name}\n
            Building ID: #{@intervention.building_id}\n
            Battery ID: #{@intervention.battery_id}\n
            Column ID: #{@intervention.column_id}\n
            Elevator ID: #{@intervention.elevator_id}\n
            Assigned Employee ID: #{@intervention.employee_id}\n
            Description: #{@intervention.report}
            "
        },
        
        :requester => {
            "name": Employee.where(user_id: @intervention.author).first.first_name + " " + Employee.where(user_id: @intervention.author).first.last_name, 
            "email": Employee.where(user_id: @intervention.author).first.email
        },
        :priority => "normal",
        :type => "problem"
        )
    end

    # POST /interventions or /interventions.json
    def create
        @intervention = Intervention.new()
        
        @intervention.author = current_user.id
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
            zendesk_intervention_ticket()
        end

    end

    def intervention_params
        params.require(:interventions).permit( :customer, :building, :battery, :column, :elevator, :employee, :result, :report, :status)
    end


end
