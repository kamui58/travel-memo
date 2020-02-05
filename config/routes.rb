Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"

  namespace :prefectures do
    resources :hokkaidos, only: :index
    resources :tohokus, only: :index
    resources :kantos, only: :index
    resources :chubus, only: :index
    resources :kinkis, only: :index
    resources :chugokus, only: :index
    resources :shikokus, only: :index
    resources :kyushus, only: :index
    resources :okinawas, only: :index
  end

  resources :users, only: [:show]
  resources :messages, only: [:index, :create]


end
