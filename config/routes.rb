require 'api'

class ApiV1Constraint
  def matches?(request)
    if request.env['HTTP_X_API_VERSION']
      request.env['HTTP_X_API_VERSION'] == 'v1'
    else
      true
    end
  end
end

Iaato::Application.routes.draw do
  root to: 'home#index'

  devise_for :users, :controllers => {:sessions => "sessions" }

  namespace :api do
    namespace :v1, path: '', constraints: ApiV1Constraint.new do
      resources :ships do
        resources :reservations
      end
      resources :locations do
        resources :reservations
      end
      resources :operators
      resources :ship_classes
    end
  end

  namespace :templates do
    get :ships
    get :locations
  end

  get '/:wildcard' => 'home#index'
end
