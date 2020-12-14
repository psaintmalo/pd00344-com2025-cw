Rails.application.routes.draw do

  resources :posts

  resources :posts do
    resources :comments, only: [:index, :new, :create, :destroy]
  end

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  post "refresh_comments", to: "comments#refresh_comments"
  post "refresh_posts", to: "posts#refresh_posts"

  get "contact", to: "home#contact"
  post "request_contact", to: "home#request_contact"

  get "bookmarks", to: "bookmarks#index"
  delete "bookmarks/:id", to: "bookmarks#destroy", as: "bookmark"
  post "bookmarks", to: "bookmarks#create"

  root "home#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
