Rails.application.routes.draw do
  # pages
  get '/' => 'game#title_screen'
  get '/worldmap' => 'game#worldmap'
  get '/moviedex' => 'game#moviedex'
  get '/save' => 'game#save_game'
  get '/load' => 'game#load_game'
  get '/battle' => 'game#battle'
  get '/win' => 'game#win_battle'
  get '/lose' => 'game#lose_battle'

  # inputs
  get '/power' => 'game#power'
  get '/start' => 'game#start'
  get '/select' => 'game#select'
  get '/buttonB' => 'game#button_b'
  get '/buttonA' => 'game#button_a'
  get '/up' => 'game#up'
  get '/right' => 'game#right'
  get '/bottom' => 'game#bottom'
  get '/left' => 'game#left'

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
