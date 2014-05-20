Portfolio::Application.routes.draw do
  devise_for :users, controllers: {registrations: "devise/registrations",
                           passwords: "users/passwords",
                           omniauth_callbacks: "omniauth_callbacks"}

  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end

  root 'home#index'

  resources :comments

  resources :messages

  namespace :api do
    namespace :v1 do
      resources :posts, :only => [ :create ]
    end
  end

end
