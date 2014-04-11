Portfolio::Application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments
  end

  root 'home#index'

  resources :projects

end
