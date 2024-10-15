Rails.application.routes.draw do
  namespace :admin do
    resources :pages
    root 'pages#index'
  end
  resources :pages
end
