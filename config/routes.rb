Rails.application.routes.draw do
  devise_for :users
  # , controllers: {
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }
  root to: "messages#index"
  resources :users, only: [:index, :edit, :update]
  resources :messages, only: [:index]

end
