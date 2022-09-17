 Rails.application.routes.draw do
  namespace :public do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  devise_scope :admin do
    get '/admin/sign_out' => 'admin/sessions#destroy'
  end

 scope module: :public do
   post 'orders/confirm' => 'orders#confirm'
   root to: "homes#top"
   get 'about' => 'homes#about'
   resources :items, only: [:index,:show]
   resources :genres, only: [:show]
   resources :movies, only: [:show]
   get 'customers/unsubscribe' => 'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   get 'customers/my_page' => 'customers#show'
   get 'customers/information/edit' => 'customers#edit'
   patch 'customers/information' => 'customers#update'
   get 'orders/done' => 'orders#done'
   resources :orders, only: [:new,:create,:index,:show]
 end
 namespace :admin do
   root to: "homes#top"
   resources :items, only: [:index,:new,:create,:show,:edit,:update,:destroy]
   resources :genres, only: [:index,:create,:edit,:update,:destroy]
   resources :customers, only: [:index,:show,:edit,:update]
   resources :orders, only: [:index,:show,:update]
   resources :order_details, only: [:update]
 end
end
