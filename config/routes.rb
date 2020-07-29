Rails.application.routes.draw do
  resources :users, except: [:new] do
    get 'all-decor', to: 'transactions#index'
    get 'unlisted-decor', to: 'transactions#unlisted'
    resources :transactions, only: [:create, :new, :show]
  end
  resources :groups
  root 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
