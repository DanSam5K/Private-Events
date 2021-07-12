Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations" }
  # devise_for :users
  root "events#index"
  resources :events
  resources :enrollments
  get 'user/show', action: :show, controller: 'users' 
  get 'user/index', action: :index, controller: 'users'
  resources :enrollments, only: [:create, :destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
