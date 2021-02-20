Rails.application.routes.draw do
  namespace :admin do
    resources :wunderground_requests

    root to: "wunderground_requests#index"
  end
end
