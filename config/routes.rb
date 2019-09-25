Rails.application.routes.draw do
  get 'pagination/index'
  get 'pagination/pagination'
  get 'pagination/get_articles'
  get 'sessions/new'
  get 'users/new'
  get 'index/index'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :articles do
  resources :users
   collection do
    get 'pagination'
  end
  end
 
  resources :users
  root 'index#index'
end
