Rails.application.routes.draw do
  devise_for :users
  # get 'posts/id'
  # get 'posts/show'
  # get 'users/id'
  # get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index' #default page

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create] do
      post "/likes/:id/like" => "likes#create", as: :likes
      post "/comments/:id/comment" => "comments#create", as: :comments
    end
  end
  resources :posts, only: [:new, :create]
  resources :likes, only: [:create]

end
