Rails.application.routes.draw do
  root 'sessions#index'                   # reroutes to login page on root
  get '/login' => 'sessions#new'          # the login page
  post '/sessions' => 'sessions#create'   # logging in (post)
  delete '/logout' => 'sessions#logout'   # logging out (delete)

  get 'instructors/new'                                   # "add instructor" page (admin only)
  get 'instructors/:id' => 'students#show'                # dashboard page (instructor only)
  get 'instructors/:id/edit' => 'instructors#edit'        # edit user page (admin/self only)
  put 'instructors/:id' => 'instructors#update'           # update user (admin/self only)
  post 'instructors/:id' => 'instructors#update_picture'  # update profile picture (admin/self)

  get 'students/new'                                # "add student" page(admin only)
  get 'students/:id' => 'students#show'             # dashboard page (student only)
  get 'students/:id/edit' => 'students#edit'        # edit user page (admin/self only)
  put 'students/:id' => 'students#update'           # update user (admin/self only)
  post 'students/:id' => 'students#update_picture'  # update profile picture (admin/self)

  get 'directory' => 'directories#index'
  get 'directory/graduates' => 'directories#graduates'
  get 'directory/blackbelts' => 'directories#blackbelts'
  get 'directory/:id' => 'directories#show'



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
