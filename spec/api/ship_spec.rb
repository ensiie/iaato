require 'spec_helper'
require 'api/ship_helper'


describe 'API', type: :request do
  describe 'Ship' do

    context 'get all' do
      before { get '/api/ships' }

      subject { last_response }

      it { should be_ok }
      its(:body) {
        should have_json_type Array
      }
    end

    context 'get one' do
      before {
        @ship = create :ship, name: 'concordia', capacity: 200
        get "/api/ships/#{@ship.id}"
      }

      subject { last_response }
      it { should be_ok }
      it_should_be_a_ship
    end

    context 'create' do
      before { post "/api/ships", name: 'concordia', capacity: 200}

      subject { last_response }

      its(:status) { should == 201 }
      it_should_be_a_ship
    end

    context 'update' do
      before {
        @ship = create :ship, name: 'concordia'
        patch "/api/ships/#{@ship.id}"
      }
    end
  end
end
