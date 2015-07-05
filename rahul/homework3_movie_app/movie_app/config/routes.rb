Rails.application.routes.draw do

  get 'search/index'

  root 'movies#index'

  resources :movies, only: [:index, :new, :show, :create, :update, :edit]

end
