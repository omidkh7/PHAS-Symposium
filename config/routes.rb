Rails.application.routes.draw do
  resources :submissions, only: [:new, :create, :index]

  root 'submissions#new'
end
