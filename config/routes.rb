Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'about' , to: 'home#about'
  get 'resume' , to: 'home#resume'
  resources :articles
end
