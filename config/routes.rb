Rails.application.routes.draw do
  resources :posts, :authors
  get 'authors/:id/posts', to: 'authors#posts_index'
  get 'authors/:id/posts/:post_id', to: 'authors#post'
end