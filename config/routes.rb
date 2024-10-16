Rails.application.routes.draw do

  namespace :admin do
    resources :pages
  end

  resources :pages do
    resources :comments
  end
  
  resources :pages
  root 'pages#index'
end
