Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'analytics#index'

  get 'manages/new' => 'manages#list'

  get 'manages/list'
  post 'manages/fb_upload'
  post 'manages/fb_change'

  get 'manages/video/:id' => "manages#video"

  get 'manages/twitter'
  get 'manage/twitter_list'
  get 'manages/delete_tweet/:id' => 'manages#delete_tweet'

  get 'manages/table'

  post 'manages/update'

  post 'manages/tweet_upload'


  get 'analytics/video/:id' => "analytics#video"
  get 'analytics/index'
  get 'analytics/profile/:id' => "analytics#profile"


  get 'db' => "dbbackup#index"


  get 'manages/snapshot'
  get 'manages/snaplist'

  post 'manages/timing'
  get 'manages/refresh_twitter'
  get 'manages/refresh_facebook'

  get 'manages/sort'

  get '/login' => "manages#login"
  post 'manages/password'


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
