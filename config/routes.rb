Rails.application.routes.draw do
  devise_for :users
  # , controllers: {
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }
  root to: "messages#index"
  resources :users, only: [:show]
  resources :messages, only: [:index, :create]

end
