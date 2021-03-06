EyePlus::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users do
    get 'users', :to => 'admin/posts#index', :as => :user_root # Rails 3
  end

  get "static_pages/introduction"

  get "static_pages/staff"

  get "static_pages/services"

  get "static_pages/home"

  get "static_pages/child"

  get "static_pages/discomfort"

  get "static_pages/glasses"

  namespace :admin do
    resources :users
  end

  # resources :users

  namespace :admin do
    resources :default_facebooks
  end

  # resources :default_facebooks  

  namespace :admin do
    resources :facebooks
  end

  # resources :facebooks

  resources :boards do
    resources :articles
  end

  namespace :admin do
    resources :boards do
      resources :articles
    end
  end
  
  namespace :admin do
    resources :questions do
      resources :answers
    end
  end

  resources :questions do
    resources :answers
  end
  
  namespace :admin do
    resources :posts
  end

  resources :posts

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'static_pages#home'

  # match "/patients/:id" => "patients#show"
  match "/news" => "posts#index"
  match "/news/:id" => "posts#show"
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
