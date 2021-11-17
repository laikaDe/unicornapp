Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :unicorns do 
      resources :superpowers
    end
  end

  root to: 'static#home'  

  # match '/auth/:google_oauth2/callback'
end
