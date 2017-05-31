Rails.application.routes.draw do
  get 'upload' => 'images#new', :as => :upload

  get 'images/index'

  get 'images/new'

  get 'images/create'

  get 'images/show'

  get 'images/edit'

  get 'images/update'

  get 'images/destroy'

  get 'categories/new'

  get 'categories/create'

  get 'categories/show'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/destroy'

  resources :images, :categories

  root 'images#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
