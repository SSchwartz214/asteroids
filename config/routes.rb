Rails.application.routes.draw do
  root "welcome#index"
  get :most_dangerous_day, to: "most_dangerous_day#index"

  namespace :api do
    namespace :v1 do
      namespace :user do
        resources :favorites, only: [:create, :index]
      end
    end
  end
end
