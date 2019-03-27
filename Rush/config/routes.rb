Rails.application.routes.draw do
  # pages
  get '/' => 'game_controller#title_screen'
  get '/worldmap' => 'game_controller#worldmap'
  get '/moviedex' => 'game_controller#moviedex'
  get '/save' => 'game_controller#save_game'
  get '/load' => 'game_controller#load_game'
  get '/battle' => 'game_controller#battle'
  get '/win' => 'game_controller#win_battle'
  get '/lose' => 'game_controller#lose_battle'

  # inputs
  get '/power' => 'game_controller#power'
  get '/start' => 'game_controller#start'
  get '/select' => 'game_controller#select'
  get '/buttonB' => 'game_controller#button_b'
  get '/buttonA' => 'game_controller#button_a'
  get '/up' => 'game_controller#up'
  get '/right' => 'game_controller#right'
  get '/bottom' => 'game_controller#bottom'
  get '/left' => 'game_controller#left'

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
