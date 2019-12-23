Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'users/new'
  namespace 'api' do
    namespace 'v1' do
      resources :courses, only: %i[index]
      resources :users, only: %i[create show]
      resources :favourites, only: %i[create index destroy]
      delete 'favourite' => 'favourites#destroy'
      post 'user_token' => 'user_token#create'
      post 'find_user' => 'users#find'
    end
  end
  root to: "api/v1/courses#index"
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
end
