Randy::Application.routes.draw do

  root :to => "pages#home"
  
  match 'addresses/all_addresses', :to => 'addresses#all_addresses'
  match 'addresses/addresses_by_subnet', :to => 'addresses#addresses_by_subnet'
  match 'addresses/addresses_by_site', :to => 'addresses#addresses_by_site'
  match 'addresses/addresses_by_network', :to => 'addresses#addresses_by_network'
  match 'addresses/tree', :to => 'addresses#tree'
  match 'addresses/dbaction', :to => 'addresses#dbaction'
  match 'addresses/dbaction_sitenode', :to => 'addresses#dbaction_sitenode'
  match 'addresses/dbaction_networknode', :to => 'addresses#dbaction_networknode'
  match 'addresses/dbaction_alladdresses', :to => 'addresses#dbaction_alladdresses'

  match 'subnets/all_subnets', :to => 'subnets#all_subnets'
  match 'subnets/subnets_by_site', :to => 'subnets#subnets_by_site'
  match 'subnets/subnets_by_network', :to => 'subnets#subnets_by_network'
  match 'subnets/tree', :to => 'subnets#tree'
  match 'subnets/dbaction', :to => 'subnets#dbaction'
  match 'subnets/dbaction_allsubnets', :to => 'subnets#dbaction_allsubnets'
  match 'subnets/dbaction_networknode', :to => 'subnets#dbaction_networknode'
    
  match 'networks/data', :to => 'networks#data'
  match 'networks/tree', :to => 'networks#tree' # this can be deleted
  match 'networks/dbaction', :to => 'networks#dbaction'

  match 'sites/all_sites', :to => 'sites#all_sites'
  match 'sites/sites_by_network', :to => 'sites#sites_by_network'
  match 'sites/tree', :to => 'sites#tree'
  match 'sites/dbaction', :to => 'sites#dbaction'
  match 'sites/dbaction_allsites', :to => 'sites#dbaction_allsites'

  match 'address_ranges/all_address_ranges', :to => 'address_ranges#all_address_ranges'
  match 'address_ranges/address_ranges_by_subnet', :to => 'address_ranges#address_ranges_by_subnet'
  match 'address_ranges/address_ranges_by_site', :to => 'address_ranges#address_ranges_by_site'
  match 'address_ranges/address_ranges_by_network', :to => 'address_ranges#address_ranges_by_network'
  match 'address_ranges/tree', :to => 'address_ranges#tree'
  match 'address_ranges/dbaction', :to => 'address_ranges#dbaction'
  match 'address_ranges/dbaction_sitenode', :to => 'address_ranges#dbaction_sitenode'
  match 'address_ranges/dbaction_networknode', :to => 'address_ranges#dbaction_networknode'
  match 'address_ranges/dbaction_alladdress_ranges', :to => 'address_ranges#dbaction_alladdress_ranges'
  
  match 'systems/data', :to => 'systems#data'
  match 'systems/tree', :to => 'systems#tree'
  match 'systems/dbaction', :to => 'systems#dbaction'
  
  match 'domain_names/data', :to => 'domain_names#data'
  match 'domain_names/dbaction', :to => 'domain_names#dbaction'
      
  match 'pages/tabs', :to => 'pages#tabs'
  match 'pages/tabbar', :to => 'pages#tabbar'
  match 'pages/toolbar', :to => 'pages#toolbar'
  
  resources :domain_mappings

  resources :systems

  resources :interfaces

  resources :address_ranges

  resources :addresses

  resources :domain_names

  resources :subnets

  resources :sites

  resources :networks
  
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
