BirdDog::Application.routes.draw do
  devise_for  :users,
              :controllers => {
                :registrations => 'users'
                # :omniauth_callbacks => "omniauth_callbacks"
              }
              
  devise_scope :user do
    resources :users, :only => [:index]
    get "login", :to => "devise/sessions#new"
    get "sign_up", :to => "users#new"
    get "logout", :to => "devise/sessions#destroy"
    # investigate the need for this
  end

  root :to => 'home#index'

  resources :properties
  resources :streets
  resources :hunts do
    member do 
      post :add_by_url
    end
    collection do  
      post :add_property
    end
  end
  # resources :hunt_properties, only: [:new, :create]
  resources :hunt_streets, only: [:new, :create]

 


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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
