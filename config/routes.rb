Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  'users#index'  #この1行を追加

  #ユーザー一覧を表示
  get '/users', to: 'users#index'
  #新規投稿（登録画面）に遷移
  get '/users/new', to: 'users#new'
  #投稿されたデータを受け取る
  post '/users', to: 'users#create'

  #投稿されてデータを編集する画面に行く
  get '/users/:id/edit', to: 'users#edit'

  #編集完了画面に遷移
  patch 'users/:id', to: 'users#update'

  # 投稿の削除を実施する
  delete '/users/:id', to:'users#destroy'

end
