require 'spec_helper'

describe 'ships endpoint', type: :request do
  it 'search all' do
    @b = Ship.create name: 'test'# , coordinates: [1.3,2.5]
    get '/api/ships/search'
    response.code.should == '200'
    JSON.parse(response.body).should == [
      JSON.parse(@b.to_json)
    ]
  end

  #it "search nearest" do
    #@b = Ship.create name: 'test', coordinates: [1.3,2.5]
    #get '/api/ships/search?near=1.3,2.5'

  #end
end
