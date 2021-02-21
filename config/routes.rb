Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  namespace :admin do
    resources :lacrosse_dumps
    resources :wunderground_requests

    root to: "wunderground_requests#index"
  end

  root to: "landing#index"
end
