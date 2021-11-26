Rails.application.routes.draw do
  devise_for :users
  resources :users do
    get '/rainbow' => 'unicorns#rainbow', status: 'rainbow', as: :rainbow 
  end

  resources :unicorns do
    resources :superpowers do
      resources :reviews
    end
  end
  root to: 'static#home'  
  get '/auth/:provider/callback', to: 'sessions#omniauth'


end
