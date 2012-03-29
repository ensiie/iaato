module Dunapi
  class API < Grape::API
    prefix 'api'

    resource "ships" do
      get '/search' do
        if params[:near].present?
          latitude, longitude = params[:near].split(',').map(&:to_f)
          Ship.near(coordinates: [latitude, longitude])
        else
          Ship.all
        end
      end
    end

  end
end
