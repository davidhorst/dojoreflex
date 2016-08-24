Rails.application.routes.draw do


  root 'sessions#index'                                   # reroutes to login page on root
  get '/login' => 'sessions#new'                          # the login page
  post '/sessions' => 'sessions#create'                   # logging in (post)
  delete '/logout' => 'sessions#logout'                   # logging out (delete)
  get 'sessions/sendemail' => 'sessions#email'   #test route

  get 'instructors/new'                                   # "add instructor" page (admin only)
  post 'instructors' => 'instructors#create'              # adding a instructors (admin only)
  put 'instructors' => 'instructors#csv_create'           # adding an instructor (admin only)
  get 'instructors/:id' => 'instructors#show'             # dashboard page (instructor only)
  get 'instructors/:id/edit' => 'instructors#edit'        # edit user page (admin/self only)
  put 'instructors/:id' => 'instructors#update'           # update user (admin/self only)
  post 'instructors/:id' => 'instructors#update_picture'  # update profile picture (admin/self)
  get 'instructors/:id/admin' => 'instructors#admin'      # admin page (admin only)


  get 'students/new'                                      # "add student" page(admin only)
  post 'students' => 'students#create'                    # adding a student (admin only)
  put 'students' => 'students#csv_create'                    # adding a student (admin only)
  get 'students/:id' => 'students#show'                   # dashboard page (student only)
  get 'students/:id/edit' => 'students#edit'
  put 'students/:id' => 'students#update'              # edit user page (admin/self only)
  post 'students/:id' => 'students#update_picture'        # update profile picture (admin/self)

  put 'students/feedback/:id' => 'students#feedback'     # Update student status based on instant-feedback form
  get 'directory' => 'directories#index'                  # directory index
  get 'directory/graduates' => 'directories#graduates'    # show graduates on index.html.erb
  get 'directory/blackbelts' => 'directories#blackbelts'  # show blackbelts on index.html.erb
  get 'directory/:id' => 'directories#show'               # show student details

  get 'cohorts/new'
  post 'cohorts' => 'cohorts#create'
  get 'cohorts/:id' => 'cohorts#show'

  get 'stacks' => 'stacks#index'
  get 'stacks/:id' => 'stacks#show'

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
