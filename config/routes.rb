Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :accounts do
    post 'withdraw', on: :member
    post 'deposit', on: :member
  end
    devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "accounts#index"
end
