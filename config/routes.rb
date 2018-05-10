Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'users/show'
  get 'users/:id', to: 'users#show', as: 'user'

  post 'subscribe', to: 'events#subscribe', as: 'subscribe'

  resources :events, :charges

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
