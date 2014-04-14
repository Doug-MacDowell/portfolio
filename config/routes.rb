Portfolio::Application.routes.draw do
# devise_for :users, controllers: {registrations: "users/registrations",
# the line above was original, but caused an error for Sign Up actions
  devise_for :users, controllers: {registrations: "devise/registrations",
                           passwords: "users/passwords",
                           omniauth_callbacks: "omniauth_callbacks"}

  resources :posts do
    resources :comments
  end

  root 'home#index'

  resources :projects

end
