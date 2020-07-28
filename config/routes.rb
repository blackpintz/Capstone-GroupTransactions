Rails.application.routes.draw do
  resources :users, except: [:new]
  root 'users#new'
end
