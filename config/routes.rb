Portfolio::Application.routes.draw do
  devise_for :users
  resources :posts

  root 'home#index'

  # Added a projects path
  resources :projects

end
