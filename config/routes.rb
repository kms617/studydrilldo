Rails.application.routes.draw do

  get 'about/index'
  root 'about#home'

  devise_for :users

  resources :goals, only: [:index, :create, :new, :show, :edit, :update, :destroy]

  resources :goals do
    resources :tasks, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  end

  resources :tasks, only: [:index, :create, :new, :show, :edit, :update, :destroy]

  resources :users, only: [:show, :update]

  resources :users do
    resources :goals, only: [:index, :create, :new, :show, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  resources :about, only: [:index, :home]
end
