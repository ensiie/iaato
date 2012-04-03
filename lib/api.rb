module Iaato
  class API < Grape::API
    prefix 'api'

    resource "ships" do
      get do
        Ship.all.to_json
      end

      get ':id' do
        Ship.find(params[:id]).to_json
      end

      post do
        Ship.create(params).to_json
      end

      patch ':id' do
        Ship.find(params[:id]).update_attributes params
      end
    end

  end
end
