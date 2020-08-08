# frozen_string_literal: true
Rails.application.routes.draw do
    resources :users, except: [:new] do
        get 'unlisted-decor', to: 'decors#unlisted'
        resources :decors do
            resources :decor_categories, only: [:new, :create]
        end
    end
    resources :categories
    root 'users#new'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end
