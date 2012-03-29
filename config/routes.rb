require 'api'

Iaato::Application.routes.draw do
  mount Iaato::API => "/"

  root to: 'home#index'

  namespace :plateform do
    get 'batiments'
  end

  get '/:arf' => 'home#index'
end
