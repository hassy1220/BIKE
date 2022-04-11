Rails.application.routes.draw do
  # get 'relationships/create'
  devise_for :users
  resources:post_bikes,only:[:new,:create,:show,:index,:edit] do
    resources:post_bike_comments,only:[:create,:destroy]
    resource:favorites,only:[:create,:destroy]
  end
  resources:users,only:[:show,:index,:edit,:update] do
    resource:relationships,only:[:create,:destroy]
    resource:room_users,only:[:create] do
     resource:chats,only:[:create,:show]
    end
  end
  get 'searches/search',as:"search"
  root to: 'homes#home'
  get 'homes/about',as:"about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
