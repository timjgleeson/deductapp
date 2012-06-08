Deductapp::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tokens, :only => [:create, :destroy]
      resources :transactions, :only => [:index, :show, :create]
      resources :budgets, :only => [:index, :show]
    end
  end

  resources :budgets

  resources :transactions 

  resources :favourites

  devise_for :users
  resources :users

  get "week/:year/:month/:day" => "home#week", :as => :week_of
  
  authenticated do
    root :to => 'home#index'
  end
  
  root :to => 'home#guest'

end
