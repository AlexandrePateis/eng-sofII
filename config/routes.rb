Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :accounts do
    member do
      get 'withdraw' => 'accounts#withdraw_form', as: :withdraw_form
      post 'withdraw' => 'accounts#withdraw', as: :withdraw
      get 'deposit' => 'accounts#deposit_form', as: :deposit_form
      post 'deposit' => 'accounts#deposit', as: :deposit
    end
  end
    devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "accounts#index"
end
