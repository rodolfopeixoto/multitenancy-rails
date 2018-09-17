Rails.application.routes.draw do
  get 'companies/new', to: 'companies#new'
  post 'companies/create'
  devise_for :users
  root to: 'companies#index'
end
