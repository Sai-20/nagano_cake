Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: "public/homes#top"
  get 'about' => 'public/homes#about', as: 'about'

  namespace :admin do
    get 'homes/top'
  end


  namespace :admin do
    resources :genres
    resources :items
    resources :customers
    resources :orders
    resources :order_details
  end

  namespace :public do
    resources :addresses, only: [:new,:index,:create,:edit,:update,:destroy]
  end

  namespace :public do
    resources :items, only: [:index,:show]
  end

  namespace :public do
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    resources :orders, only:  [:new,:index,:show,:create,:update]
  end


  namespace :public do
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as:'destroy_all'
    resources :cart_items, only: [:index,:create,:update,:destroy]
  end

  scope module: :public do
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/information/edit' => 'customers#edit', as: 'info_edit'
    patch 'customers/information' => 'customers#update', as: 'info_update'
    get 'customers/withdraw' => 'customers#withdraw'
    patch 'customers/leave' => 'customers#leave'
  end
  namespace :public do
    get 'homes/top'
  end
end
