Rails.application.routes.draw do

  #Account Controller Routes
  #GET
  get "account/confirm/:id", to: "account#confirm"

  get "account/register"

  get "account/login"

  get "account/logout"

  #POST
  post "account/create"

  post "account/signin"
  
  #Agent Controller Routes
  #GET
  get "agent/index"

  get "agent/index/:page", to: "agent#index"
  
  get "agent/edit/:id", to: "agent#edit"

  get "agent/delete/:id", to: "agent#delete"

  #POST
  post "agent/invite"

  post "agent/save"

  #Bussines Controller Routes
  #GET
  get "business/index"

  get "business/index/:page", to: "business#index"

  get "business/edit/:id", to: "business#edit"

  get "business/delete/:id", to: "business#delete"

  get "business/add_agent"

  get "business/remove_agent"

  #POST
  post "business/create"

  post "business/save"

  #Catalog Controller Routes
  #GET
  get "catalog/areas/:page", to: "catalog#areas"

  get "catalog/categories/:page", to: "catalog#categories"

  get "catalog/states/:page", to: "catalog#states"

  get "catalog/area/:id", to: "catalog#areas"

  get "catalog/category/:id", to: "catalog#categories"

  get "catalog/state/:id", to: "catalog#states"

  #DELETE
  delete "catalog/delete_area/:id", to: "catalog#delete_area"

  delete "catalog/delete_category/:id", to: "catalog#delete_category"

  delete "catalog/delete_state/:id", to: "catalog#delete_state"

  #POST
  post "catalog/areas/add", to: "catalog#add_areas"

  post "catalog/categories/add", to: "catalog#add_categories"
  
  post "catalog/states/add", to: "catalog#add_states"

  post "catalog/area/create", to: "catalog#create_area"

  post "catalog/category/create", to: "catalog#create_category"

  post "catalog/state/create", to: "catalog#create_state"

  #Client Controller Routes
  #GET
  get "client/index"

  get "client/index/:page", to: "client#index"
  
  get "client/edit/:id", to: "client#edit"

  get "client/delete/:id", to: "client#delete"

  #POST
  post "client/invite"

  post "client/save"

  #Home Controller Routes
  #GET
  get "home/index"

  get "home/index/:id", to: "home#index"
    
  get "home/about"

  #POST

  #Report Controller Routes
  #GET
  get "report/index"

  #POST

  #Schedule Controller Routes
  #GET
  get "schedule/index"

  get "schedule/activities/:id", to: "schedule#activities"

  #POST

  post "schedule/create"

  post "schedule/add_activity"

  #Setting Controller Routes
  #GET
  get "admin/index", to: "setting#index"

  get "admin/first-configuration", to: "setting#first"

  #POST
  post "setting/update"

  #Solution Controller Routes
  #GET
  get "solution/index"
  
  get "solution/solution/:id", to: "solution#solution"

  get "solution/show/:id", to: "solution#show"

  #POST
  post "solution/acept"

  post "solution/create"
  
  #Ticket Controller Routes
  #GET
  get "ticket/index"

  get "ticket/index/:page", to: "ticket#index"

  get "ticket/ticket/:id", to:"ticket#ticket"

  #POST
  post "ticket/create"

  post "ticket/send_response"

  post "ticket/asign"

  post "ticket/change"

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
