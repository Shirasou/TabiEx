Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :trips do
    resource :trip_likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
