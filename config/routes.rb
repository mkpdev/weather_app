Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  get "/current_weather", to: "weathers#current_weather"
  get "/current_air_pollution", to: "weathers#current_air_pollution"
  get "/geocoding", to: "weathers#geocoding"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
