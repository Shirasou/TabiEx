Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :trips do
    resource :trip_likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  post 'trips/upload_image' => 'trips#upload_image', defaults: { format: :json }
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :trip_ways
  resources :tags do
    get 'trips', to: 'trips#search'
  end
  resources :notifications, only: [:index]
  delete 'notifications' => 'notifications#all_destroy', as: 'notifications_all_destroy'
  resources :categories, only: [:create, :show]
  get '/search', to: 'searches#search'
end
