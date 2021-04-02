require 'rails_helper'

RSpec.describe InterventionsController do
    context 'when intervention is submitted by employee' do
        it 'checks HTTP response status' do
            intervention = Intervention.create
            expect(response.status).to eq(200)
        end
    end
end