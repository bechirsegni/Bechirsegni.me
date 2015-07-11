Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  devise_scope :user do
    get 'admin', :to => 'devise/sessions#new'
    post 'admin', :to => 'devise/sessions#new'
    get 'register', :to => 'devise/registrations#new'
    post 'register', :to => 'devise/registrations#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'password', to: 'devise/passwords#new'
    get 'account', to: 'devise/registrations#edit'
  end

  get 'about' , to: 'home#about'
  get 'resume' , to: 'home#resume'
  resources :articles
  get 'tags/:tag', to: 'articles#index', as: :tag
  resources :educations
  resources :experiences
  resources :technologies
  resources :projects

  resources 'contacts', only: [:new, :create]

  root 'home#index'

end
