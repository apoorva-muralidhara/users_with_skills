Rails.application.routes.draw do
  root 'csv_uploads#new'

  resources :csv_uploads, only: :create
end
