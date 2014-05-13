Portfolio::Application.routes.draw do
  devise_for :users, controllers: {registrations: "devise/registrations",
                           passwords: "users/passwords",
                           omniauth_callbacks: "omniauth_callbacks"}

  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end

  root 'home#index'

  resources :comments

  namespace :api do
    namespace :v1 do
      resources :posts, :only => [ :create ]
    end
  end

end
