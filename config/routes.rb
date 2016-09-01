Rails.application.routes.draw do
  root 'institutions#index'

  resources :institutions do
    resources :periods
  end
end
