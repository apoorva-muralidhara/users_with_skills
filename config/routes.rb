Rails.application.routes.draw do
  root 'csv_uploads#new'

  resources :csv_uploads, only: :create

  namespace :api do
    resources :users, only: :index
  end
end
