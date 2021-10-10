Rails.application.routes.draw do


resources :questions

get '/questions', to: 'questions#create'
get  '/questions', to: 'questions#index'
get  '/questions/new', to: 'questions#new'
root 'pages#index'

end
