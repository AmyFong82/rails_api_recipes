Rails.application.routes.draw do
  resources :recipes, only: [:index]

  get '/recipes/details/:name', to: 'recipes#show'

  post '/recipes', to: 'recipes#create'

  put '/recipes', to: 'recipes#update'

end
