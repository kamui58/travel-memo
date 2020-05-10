Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

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
  resources :posts, only: [:index, :create, :destroy, :edit, :update, :show] do
    get :search, on: :collection
  end

end
