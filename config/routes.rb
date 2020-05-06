Rails.application.routes.draw do

  root "users#home"
  get "/home" => "users#top"
  get "/home/about" => "users#about"


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:show, :edit, :update, :index]

  resources :books, only:[:index, :show, :new, :create, :edit, :update, :destroy]

end
