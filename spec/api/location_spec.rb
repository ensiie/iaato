require 'spec_helper'
require 'api/location_helper'


describe 'API', type: :request do
  describe 'Location' do

    context 'get all' do
      before {
        @locations = 10.times.map{ FactoryGirl.create(:location) }
        get '/api/locations'
      }

      subject { last_response }

      it { should be_ok }
      its(:body) {
        should have_json_type Array
      }

      10.times do |i|
          it_should_be_a_location i.to_s + "/"
      end
    end

    context 'get one' do
      before do
        @location = FactoryGirl.create(:location, name: 'grotte0', capacity: 200)
        get "/api/locations/#{@location.id}"
      end

      subject { last_response }
      it { should be_ok }
      it_should_be_a_location
      its_name_should_be "grotte0"
      its_capacity_should_be 200
    end

    context 'create' do
      before { post "/api/locations", name: 'grotte0', capacity: 200}

      subject { last_response }

      its(:status) { should == 201 }
      it_should_be_a_location
    end

    context 'update' do
      before {
        @location = create :location, name: 'concordia'
        patch "/api/locations/#{@location.id}"
      }
    end
  end
end
