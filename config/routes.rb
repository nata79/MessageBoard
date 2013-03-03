MessageBoard::Application.routes.draw do
  devise_for :users

  resources :boards
end
