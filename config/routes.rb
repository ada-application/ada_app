AdaApp::Application.routes.draw do
  resources :apps

  resources :questions

  root :to => "home#index"
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users
end