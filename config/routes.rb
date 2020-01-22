Rails.application.routes.draw do

  # session_path - POST
  resources :sessions, :only => [:create,]
  delete 'sessions/', to: 'sessions#destroyall'
  root 'sessions#new'

  get 'calendar' => 'calendar#show'
  resources :calendar, :only => [:show]
  resources :bookings, :only => [:new, :show, :create, :edit, :update, :destroy]

  get 'admin' => 'admin#show'
  post 'admin/upload', to: 'admin#upload'
  resources :admin, :only => [:show]

  # price_path / needed for form_for
  resources :price, :only => [:create, :update, :destroy]

  # contact_path / needed for form_for
  resources :contact, :only => [:create, :update, :destroy]

  # setting_path
  resources :setting, :only => [:update]

  match '*unmatched_route', :to => 'application#render_404', :via => :all
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
