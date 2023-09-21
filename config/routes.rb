Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'signup',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
  }

  root to: 'splash#index'

  # Defines the root path route ("/")
  # root "articles#index"

  resources :groups, only: [:index, :new, :create] do
    resources :entities, only: [:index, :new, :create]
  end

end
