Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :unicorns do 
    resources :superpowers
  end
  root "unicorns#index"
end
