Rails.application.routes.draw do

    # 顧客用
  # URL /customers/sign_in ...

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

# 管理者用
  post 'phone_numbers/import' => 'admin/phone_numbers#import', as: 'import'
  namespace :admin do
    root to: 'phone_numbers#index'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :phone_numbers, only: [:index, :create, :show, :edit, :update]
    resources :contracts, only: [:index]
  end

# 顧客用
  get 'contracts/complete' => 'public/contracts#complete', as: 'complete'
  get 'contracts/termination' => 'public/contracts#termination', as: 'termination'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'
  scope module: :public do
    resources :contracts, only: [:new, :create, :index, :update]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :phone_numbers, only: [:index, :show]
  end
  get 'customers/my_page' => 'public/customers#show', as: 'my_page'
  get 'customers/information/edit' => 'public/customers#edit', as: 'edit_information'
  patch 'customers/information' => 'public/customers#update', as: 'information'
  #退会機能
  get 'customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'

  root to: 'public/homes#top'

  get 'search' => 'public/phone_numbers#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
