Rails.application.routes.draw do

  #Account Controller Routes
  #GET
  get "account/confirm/:id"

  get "account/register"

  get "account/login"

  get "account/logout"

  #POST
  post "account/create"

  post "account/signin"
    
  #Agent Controller Routes
  #GET
  get "agent/index"

  get "agent/edit"

  #POST
  post "agent/create"

  #Bussines Controller Routes
  #GET

  #POST
  post "business/update"
    
  #Client Controller Routes
  #GET
  get "client/index"

  #POST
  post "client/create"

  #Home Controller Routes
  #GET
  get "home/index"
    
  get "home/about"

  #POST

  #Report Controller Routes
  #GET
  get "report/index"

  #POST

  #Scheldule Controller Routes
  #GET
  get "scheldule/index"

  #POST

  #Setting Controller Routes
  #GET
  get "setting/index"

  #POST
  post "setting/update"

  #Solution Controller Routes
  #GET
  get "solution/index"
  
  get "solution/solution"

  #POST  
  post "solution/search"
  
  #Ticket Controller Routes
  #GET
  get "ticket/index"

  #POST
  post "ticket/create"

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
