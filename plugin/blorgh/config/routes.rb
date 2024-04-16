require 'sidekiq/web'
require 'sidekiq/cron/web'
Blorgh::Engine.routes.draw do
  root to: "articles#index"
  resources :articles do
    resources :comments
  end
  mount Sidekiq::Web => '/sidekiq'
end
