MessageBoard::Application.routes.draw do
  devise_for :users

  resources :boards, only: [:new, :create]

  # Normal Board Member Access Level
  resources :boards, only: [:show], module: 'board_access/normal' do
    resources :messages, only: [:create]
  end
end
