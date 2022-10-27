Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'flights#index'
  get '/bookings/new', to: 'bookings#new', as: 'new_booking'
  post '/bookings', to: 'bookings#create', as: 'bookings'
end
