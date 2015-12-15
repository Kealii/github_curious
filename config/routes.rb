Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/create'
  get '/auth/github', as: :login
  get '/auth/github/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
end
