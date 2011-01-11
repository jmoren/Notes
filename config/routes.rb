Notas::Application.routes.draw do
  match '/notas/search' => "notas#search"
  #match 'pages/topic/:topic' => "pages#topic"
  #match 'pages/category/:category' => "pages#category"

  match '/admin' => "admin#index"
  namespace :admin do
    resources :notas, :except => [:new, :create]
    resources :users, :except => [:new, :create, :destroy]
    resources :comments, :except => [:new, :create]
  end

  get '/tags/:tag' => "tags#by_tag", :as => :search_by_tag

  resources :notas do
    resources :comments, :only => [:new,:create,:edit, :update] do
      get 'comments_by_note', :on => :collection
      collection do
        post :update_attribute_on_the_spot
      end
    end

    collection do
      post :update_attribute_on_the_spot
    end

    member do
      post :add_vote
    end
  end

  devise_for :users
  root :to => "notas#index"
  #match '/' => redirect("/notas")
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

