Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  use_doorkeeper

  namespace :api do
  	resources :users, :defaults => { :format => 'json' } do
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
