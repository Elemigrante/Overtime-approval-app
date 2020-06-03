Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
    resources :admin_users
    resources :posts
    
    root to: "users#index"
  end
  
  resources :audit_logs, except: %i[:new :edit :destroy] do
    member do
      get :confirm
    end
  end
  
  resources :posts do
    member do
      get :approve
    end
  end
  
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
