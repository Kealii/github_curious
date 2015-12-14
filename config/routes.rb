Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/github', as: :login
end
