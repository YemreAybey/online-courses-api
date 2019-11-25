Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :courses
    end
  end
  root to: "api/v1/courses#index"
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
