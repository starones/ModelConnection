Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ____クライアント側devise_____
  devise_for :clients, skip: [:passwords,], controllers: {
    registrations: "client/registrations",
    sessions: 'client/sessions'
  }

  # ____モデル側devise_____
  devise_for :actors, skip: [:passwords,], controllers: {
    registrations: "actor/registrations",
    sessions: 'actor/sessions'
  }

  # ----管理者側devise------
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # ____クライアント側____
  namespace :client do
    resources :clients, only:[:show, :edit, :update, :favorite] do
      get :favorites, on: :collection
    end
    resources :job_requests
  end

  # ____モデル側____
  scope module: :actor do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :actors, only:[:index, :show, :edit, :update] do
    resource :favorites, only:[:create, :destroy]
    end
    resources :job_requests, only:[:index]
    resources :clients, only:[:index]
    get 'inquiry' => 'inquiries#index'
    post 'inquiry/confirm' => 'inquiries#confirm'
    post 'inquiry/thanks' => 'inquiries#thanks'
  end

  # ------管理者側-------
  namespace :admin do
    get 'top' => 'homes#top'
    resources :actors, only:[:index, :show, :edit, :update]
    resources :clients, only:[:index, :show, :edit, :update]
  end
end
