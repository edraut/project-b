ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session

  map.resources :page_resources


  map.root :controller => 'pages', :id => 0, :action => 'show', :name => 'Home'
  
  map.resources :blog_entries
  map.resources :projects
  map.resources :attachments
  map.resources :text_elements
  map.resources :template_elements
  map.resources :pages
  map.resources :content_templates

  map.namespace :admin do |admin|

    admin.root :controller => :pages

    admin.resources :attachments
    admin.resources :pages
    admin.resources :page_partials, :controller => :pages
    admin.resources :page_resources
    admin.resources :content_templates
    admin.resources :page_templates, :controller => :content_templates
    admin.resources :partial_templates, :controller => :content_templates
    admin.resources :template_elements
    admin.resources :blog_entries
    admin.resources :projects
  end

  map.home 'home', :controller => 'pages', :id => 0, :action => 'show', :name => 'Home'
  map.about 'about', :controller => 'pages', :id => 0, :action => 'show', :name => 'About'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
