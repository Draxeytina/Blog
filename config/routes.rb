Rails.application.routes.draw do
  devise_for :users
  # get 'posts/id'
  # get 'posts/show'
  # get 'users/id'
  # get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index' #default page

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      post "/likes/:id/like" => "likes#create", as: :likes
      post "/comments/:id/comment" => "comments#create", as: :comments
      post "/comments/:id/comment" => "comments#destroy", as: :comments_destroy
    end
  end
  resources :posts, only: [:new, :create, :destroy]
  resources :likes, only: [:create]

  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :new, :create, :show, :destroy] do
  #     resources :comments, only: [:new, :create, :destroy]
  #     resources :likes, only: [:create]
  #   end
  # end

end
