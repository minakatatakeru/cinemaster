Rails.application.routes.draw do
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_scope :admin do
    get '/admin/sign_out' => 'admin/sessions#destroy'
  end
  
  scope module: :public do
   root to: "homes#top"
  end
  
  namespace :admin do
   root to: "homes#top"
  end 
  
end
