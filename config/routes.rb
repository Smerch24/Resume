Rails.application.routes.draw do
  namespace :admin do
    resources :pages do
      resources :comments
    end
  end
  resources :pages
  root 'pages#index'
end
