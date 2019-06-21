Rails.application.routes.draw do
#likesコントローラ
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
#usersコントローラ
  post "logout" => "users#logout"
  post "login" => "users#login"
  get "login" => "users#login_form"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post  "users/create" => "users#create"
  get "signup" => "users#new"
  get 'users/index'
  get "users/:id" => "users#show"
  get "users/:id/likes" => "users#likes"
#postsコントローラ
  get 'posts/index'
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" =>"posts#destroy"
#homeコントローラ
  get "/" => "home#top"#ローカルホストに繋いだときにtopがでるようにルートを変更
  get "about" => "home#about"

end
