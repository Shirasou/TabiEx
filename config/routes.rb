Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :trips do
    resource :trip_likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  	collection do
      get 'unsubscribe'
      patch 'withdraw'
    end
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  get '/search', to: 'searches#search'
end
