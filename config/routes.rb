YoloArcher::Application.routes.draw do
  resources :sources
  resources :annotations, only: [:new, :create, :edit, :update, :destroy]

  root to: 'sources#index'
end
