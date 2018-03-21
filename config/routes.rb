Rails.application.routes.draw do
  root 'home#index'
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {:registrations => "users/registrations",:sessions => "users/sessions" }
  resources :curris
  resources :assignments do
    member do
      post 'submission'
    end
  end
  get 'home/index'
  get 'home/wating'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
