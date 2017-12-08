Rails.application.routes.draw do

  resources :lists do
    resources :items do
      member do
        put :toggle
      end
    end
  end

  devise_for :users
  get 'welcome/index'

  root to: "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
