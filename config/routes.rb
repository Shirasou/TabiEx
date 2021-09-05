Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
<<<<<<< HEAD
  resources :trips
=======
  root to: 'homes#top'
>>>>>>> a0acbb0fad66d49b6c7308e62a782f808e4c6127
end
