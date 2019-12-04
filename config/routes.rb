Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'users/new'
  namespace 'api' do
    namespace 'v1' do
      resources :courses
      resources :users, only: %i[create update destroy show]
      resources :favourites, only: %i[create destroy index]
      post 'user_token' => 'user_token#create'
      post 'find_user' => 'users#find'
    end
  end
  root to: "api/v1/courses#index"
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
