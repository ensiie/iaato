class HomeController < ApplicationController
  def index
    render text: 'yeah', layout: 'application'
  end
end
