Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i(new create destroy index show)
  resource :session, only: [:new, :create, :destroy]
  resources :goals 
  resources :user_comments, only: %i(new create)
end
