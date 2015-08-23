Rails.application.routes.draw do
  resources :submissions

  root 'submissions#index'
end
