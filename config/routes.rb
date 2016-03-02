Rails.application.routes.draw do
  post '/cleaning' => 'cleanings#create', as: 'create_cleaning'
  resources :chores, :cleanings
end
