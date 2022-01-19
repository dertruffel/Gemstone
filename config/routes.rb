Rails.application.routes.draw do
  resources :posts do
    member do
      post :vote_up, :vote_down
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'home/about'
  get 'admin_panel/import'
  get 'admin_panel/export'
  resources :admin_panel
end
