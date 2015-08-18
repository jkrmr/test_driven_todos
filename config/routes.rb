Rails.application.routes.draw do
  resources :todos
  resource :session, only: %i(new create)

  root to: 'todos#index'
end
