InvestmentTools::Engine.routes.draw do
  root to: "portfolios#index"
  resources :portfolios
  resources :brands
end
