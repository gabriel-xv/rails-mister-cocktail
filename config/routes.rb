Rails.application.routes.draw do
  resources :cocktails, except: [:update, :edit, :destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
