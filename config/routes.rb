Rails.application.routes.draw do
  get 'users/show'
  post 'subscribe', to: 'events#subscribe', as: 'subscribe'
  resources :events
  root to: 'static_pages#home'
  devise_for :users
  get 'users/:id', to: 'users#show', as: 'user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
