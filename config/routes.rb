 Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

 scope module: :public do
   post 'orders/confirm' => 'orders#confirm'
   root to: "homes#top"
   get 'about' => 'homes#about'
   resources :movies, only: [:new, :create, :show]
   resources :comments, only: [:create, :edit, :update, :destroy]
   get 'customers/unsubscribe' => 'customers#unsubscribe'
   patch 'customers/withdraw' => 'customers#withdraw'
   resources :customers, only: [:index, :show, :edit, :update, :destroy]
   post 'homes/guest', to: 'homes#guest'
 end

end
