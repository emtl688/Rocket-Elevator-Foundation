require 'rails_helper'
require 'faker'

RSpec.describe Employee, :type => :model do
    subject {
        described_class.new(first_name: "John",
                            last_name: "Doe",
                            title: "Technician",
                            email: "test@test.com",
                            created_at: Faker::Date.between(from: '2018-02-23', to: '2021-02-23'),
                            updated_at: Faker::Date.between(from: '2018-02-23', to: '2021-02-23'),
                            user_id: 1) 
    }

    describe "Associations" do
        it { should belong_to(:user).without_validating_presence }
    end


    it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

    it "is not valid without a first name" do
        subject.first_name = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a last name" do
        subject.last_name = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
        subject.email = nil
        expect(subject).to_not be_valid
    end

end