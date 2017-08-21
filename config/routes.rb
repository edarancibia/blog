Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'

  get 'welcome/index'

  get "special", to:"welcome#index"

  root :to => "welcome#index"

  resources :articles
  	#get "/articles"
  	#post "/articles"
  	#delete "/articles/:id"
  	#get "/articles/:id"
  	#get "/articles/new"
  	#get "/articles/:id/edit"
  	#patch "/articles/:id"
  	#put "/articles/:id"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
