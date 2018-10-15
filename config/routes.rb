Rails.application.routes.draw do
  mount RailsAdmin::Engine => '//command_center/super_admin', as: 'rails_admin'
  devise_for :users
  
  root to: "pages#index"
  resources :pages, only: :index do
    post :invite, on: :collection
  end
  
  get "/admin" => "pages#admin", as: :admin
  get "/member" => "pages#member", as: :member
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
