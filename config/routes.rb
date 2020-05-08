Rails.application.routes.draw do
  root "welcome#index"

  resources :rooms, only: [:new, :create, :show]
end
