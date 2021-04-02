require "rails_helper"

RSpec.describe "routes for Interventions", :type => :routing do
    it "routes /interventions to the Interventions controller" do
        expect(get("/interventions")).
        to route_to("interventions#index")
    end
end