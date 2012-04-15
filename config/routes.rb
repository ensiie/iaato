require 'api'

Iaato::Application.routes.draw do
  mount Iaato::API => "/"

  root to: 'home#index'


  get '/:wildcard' => 'home#index'
end
