Rails.application.routes.draw do

  # Post routes
  resources :posts

  # Nested routes for comments
  resources :posts do
    resources :comments, only: [:index, :new, :create, :destroy]
  end

  # Routes for devise
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  # Routes for the AJAX actions
  post "refresh_comments", to: "comments#refresh_comments"
  post "refresh_posts", to: "posts#refresh_posts"

  # Home routes
  root "home#home"
  get "contact", to: "home#contact"
  post "request_contact", to: "home#request_contact"

  # Bookmarks routes
  get "bookmarks", to: "bookmarks#index"
  delete "bookmarks/:id", to: "bookmarks#destroy", as: "bookmark"
  post "bookmarks", to: "bookmarks#create"

end
