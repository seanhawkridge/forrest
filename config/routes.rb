Rails.application.routes.draw do

  get 'tournaments/new'

  root 'tournaments#new'

  resources :tournaments
  resources :players

  get 'tournaments/:id/build_tournament', to: 'tournaments#build_tournament'
  post 'tournaments/:id/build_tournament', to: 'tournaments#build_tournament'

end
