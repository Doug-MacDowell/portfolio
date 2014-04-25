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

end
