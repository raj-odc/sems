Rails.application.routes.draw do
  devise_for :users
  #
  root to: "profiles#index"
  #
  resources :address
  resources :address_types
  resources :board_types
  resources :class_lists do
    collection do
      get "update_class_list"
    end
    member do
      get "class_list_info"
    end
  end
  resources :exam_infos
  resources :fees_types
  resources :fees_structures
  resources :message_types
  resources :profile_types
  resources :profiles
  resources :roles
  resources :users
  resources :salary_details
  resources :site_customizations
  resources :staffs do
    collection do
      get "mark_list"
      get "mark_entry"
    end
  end
  resources :students
  resources :work_experiences

  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~API ROUTES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  namespace :api, :defaults => { :format => 'json',layout: false } do
    resources :addresses
    resources :address_types
    resources :board_types
    resources :class_lists do
      member do
        get "class_list_info"
      end
    end
    resources :exam_types
    resources :fees_types
    resources :fees_structures
    resources :marks
    resources :message_types
    resources :profile_types
    resources :profiles
    resources :roles
    resources :salary_details
    resources :staffs
    resources :students
    resources :subjects
    resources :users
  end
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
