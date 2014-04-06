Portfolio::Application.routes.draw do
  resources :comments

  devise_for :users
  resources :posts

  root 'home#index'

  # Added a projects path
  resources :projects

end
