Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "images/upload"
  root 'home#index'
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {:registrations => "users/registrations",:sessions => "users/sessions" }
  resources :curris
  resources :assignments do
    member do
      # 수정해야함
      get 'submissions'
      get 'submission', as: :destroy_submission, action: :destroy_submission
      post 'submission'
      get 'edit_submission', as: :edit_submission, action: :edit_submission
      # put 'update_submission', as: :update_submission, action: :update_submission
      patch 'update_submission', as: :update_submission, action: :update_submission
    end
  end
  resources :events do
    member do
      post 'ecomment'
    end
  end
  get 'submissions/:id' => 'assignments#show_submission', as: "submission"
  get 'home/index'
  get 'home/wating'
  post 'submission/:id/scomments' => 'assignments#scomments', as: "admin_submission_scomments"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
