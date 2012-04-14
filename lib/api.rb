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

      get ':id/reservations' do
        Ship.find(params[:id]).reservations.to_json
      end

      post do
        s = Ship.save(params).to_json
      end

      patch ':id' do
        Ship.find(params[:id]).update_attributes params
      end
    end

    resource "locations" do
      get do
        Location.all.to_json
      end

      get ':id' do
        Location.find(params[:id]).to_json
      end

      get ':id/reservations' do
        Location.find(params[:id]).reservations.to_json
      end

      post do
        Location.create(params).to_json
      end

      patch ':id' do
        Location.find(params[:id]).update_attributes params
      end
    end
  end
end
