Rails.application.routes.draw do
  get 'home/mypage'
  get 'comments/create'
  devise_for :users
  root "boards#index"

  resources :boards do
    resource :comments, only: [:create]
  end

  delete "comments/:id" => "comments#destroy"

  get "home/mypage" => "home#mypage"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
