Rails.application.routes.draw do
    root to: "teams#index"
    resources :teams do
      resources :games
    end
end
