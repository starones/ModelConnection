Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ____クライアント側devise_____
  devise_for :clients,skip: [:passwords,], controllers: {
    registrations: "client/registrations",
    sessions: 'client/sessions'
  }

  # ____モデル側devise_____
  devise_for :actors,skip: [:passwords,], controllers: {
    registrations: "actor/registrations",
    sessions: 'actor/sessions'
  }

  # ____クライアント側____
  namespace :client do
    resources :clients, only:[:show, :edit, :update]
    resources :job_requests
    resource :favorites, only:[:create, :destroy]
    get 'search' => 'search#search'
  end

  # ____モデル側____
  scope module: :actor do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :actors, only:[:index, :show, :edit, :update]
    resources :job_requests, only:[:index, :show]
    resources :clients, only:[:index, :show]
    get 'search' => 'search#search'
    get 'inquiry' => 'inquiry#index'
    post 'inquiry' => 'inquiry#confirm'
    post 'inquiry' => 'inquiry#thanks'
  end

end
