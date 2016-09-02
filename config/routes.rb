Rails.application.routes.draw do

  get 'tournaments/new'

  root 'tournaments#new'

  resources :tournaments

end
