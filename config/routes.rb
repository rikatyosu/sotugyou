Rails.application.routes.draw do
  root 'home#top'

  # ログイン関連
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # ユーザー登録
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # cars（RESTful）
  resources :cars

  # blogs に紐づくコメント（入れ子構造）
  resources :blog do
    resources :comments, only: [:create, :destroy]
  end

  # users のルーティングは明示的に必要なものだけ書く
  resources :users, only: [:new, :create]
  
end

