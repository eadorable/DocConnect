# Rails.application.routes.draw do
#   devise_for :users
#   root to: "pages#home"
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end

Rails.application.routes.draw do
  devise_for :users

  resources :appointments
  resources :patients do
    resources :medical_histories
  end


  root 'appointments#index'
end
