Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      resources :watchlists
      post "signup", to: "users#create"
      post "login", to: "sessions#create"
    end
  end
end
