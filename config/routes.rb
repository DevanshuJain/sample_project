Rails.application.routes.draw do
  get 'admins/index'

  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # get 'welcome/index'
  root 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :admins 
  
  get '/:article_id/verify', to: 'admins#verify', :as => 'verify'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
