require 'api'

Dunapi::Application.routes.draw do
  mount Dunapi::API => "/"

  root to: 'home#index'

  namespace :plateform do
    get 'batiments'
  end

  get '/:arf' => 'home#index'
end
