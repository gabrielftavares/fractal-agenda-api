Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :contacts, only: %i[index show create update destroy]
      resources :sessions, only: %i[create destroy]
      resources :registrations, only: %i[create]
    end
  end
end
