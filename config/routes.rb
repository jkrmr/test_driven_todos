Rails.application.routes.draw do
  resources :todos do
    resource :completion, only: %i(create destroy)
  end

  resource :session, only: %i(new create)

  root to: 'todos#index'
end
