YoloArcher::Application.routes.draw do
  resources :sources do
    resources :annotations, except: [:show, :index]
  end

  root to: 'sources#index'
end
