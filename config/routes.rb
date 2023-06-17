Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:edit, :update]
  get '/extrato', to: 'transactions#extrato', as: 'extrato_transactions'

  resources :accounts do
    member do
      get 'transfer', to: 'accounts#transfer_form', as: :transfer_form
      post 'transfer', to: 'accounts#transfer', as: :transfer
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
