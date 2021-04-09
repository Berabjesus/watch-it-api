Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json }, path: '/api' do
    namespace 'v1', defaults: { format: :json }, path: '/api/v1'  do
      resources :users, only: [:create]
      resources :watchlists
      post "signup", to: "users#create"
      post "login", to: "users#login"
    end
  end
end
