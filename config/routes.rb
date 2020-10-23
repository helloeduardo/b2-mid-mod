Rails.application.routes.draw do
  get 'mechanic/index'
  get 'mechanic/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanics#index'
  get '/amusement_parks/:id', to: 'amusement_parks#show'
end
