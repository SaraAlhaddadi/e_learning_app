Rails.application.routes.draw do
  get 'home/home'
  resources :enrollments
  resources :courses do
    resources :lessons
    resources :tests
  end
  scope '/admin' do
    resources :users
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#home'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
end
