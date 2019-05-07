Rails.application.routes.draw do
  health_check_routes
  resources :hello, only: [:show, :update], param: :username
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
