YoloArcher::Application.routes.draw do
  resources :sources do
    resources :annotations, except: [:show, :index]
  end

  match 'sources/:source_id/annotations/:id/up' => 'annotations#up', via: :put, as: 'source_annotation_up'
  match 'sources/:source_id/annotations/:id/down' => 'annotations#down', via: :put, as: 'source_annotation_down'

  root to: 'sources#index'
end
