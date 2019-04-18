Rails.application.routes.draw do

  get "posts", to: "posts#index", as: :posts

  get "posts/new", to: "posts#new", as: :new_post

  post "posts", to: "posts#create"

  get "posts/:id", to: "posts#show", as: :post

  get "posts/:id/edit", to: "posts#edit", as: :edit_post

  patch "posts/:id", to: "posts#update"

  delete "posts/:id", to: "posts#destroy"


  get "authors", to: "authors#index", as: :authors

  get "authors/new", to: "authors#new", as: :new_author

  post "authors", to: "authors#create"

  get "authors/:id", to: "authors#show", as: :author

  get "authors/:id/edit", to: "authors#edit", as: :edit_author

  patch "authors/:is", to: "authors#update"

  delete "authors/:id", to: "authors#destroy"

end
