Rails.application.routes.draw do
  root 'welcome#index'
  get 'sessions/create'
  get '/auth/github', as: :login
end
