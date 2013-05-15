YoloArcher::Application.routes.draw do
  resources :sources do
    resources :annotations, except: [:show, :index]
  end

  match 'sources/:source_id/annotations/:id/up' => 'annotations#up', via: :put, as: 'source_annotation_up'
  match 'sources/:source_id/annotations/:id/down' => 'annotations#down', via: :put, as: 'source_annotation_down'
  
  match 'sources/:id/up' => 'sources#up', via: :put, as: 'source_up'
  match 'sources/:id/down' => 'sources#down', via: :put, as: 'source_down'

  root to: 'sources#index'
end
