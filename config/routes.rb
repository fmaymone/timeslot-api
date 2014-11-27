Rails.application.routes.draw do

  namespace :v1, defaults: { format: :json } do
    get 'slots/', to: 'base_slots#index'
    get 'slots/:id', to: 'slots#show', as: 'slot', constraints: { id: /\d+/ }
    post 'slots', to: 'base_slots#create'
    patch 'slots/:id', to: 'slots#update', as: 'slot_update'
    delete 'slots/:id', to: 'slots#destroy', as: 'slot_delete'

    get 'media-signature', to: 'media#create_signature'

    get 'users', to: 'users#index'
    get 'users/:id', to: 'users#show', as: 'user', constraints: { id: /\d+/ }
    post 'users', to: 'users#create', as: 'user_create'
    patch 'users/:id', to: 'users#update', as: 'user_update'
    delete 'users/:id', to: 'users#destroy', as: 'user_delete'

    scope :groups do
      get '',
          to: 'groups#index',
          as: 'groups'
      get ':group_id',
          to: 'groups#show',
          as: 'group',
          constraints: { id: /\d+/ }
      post '',
           to: 'groups#create',
           as: 'group_create'
      patch ':group_id',
            to: 'groups#update',
            as: 'group_update'
      delete ':group_id',
             to: 'groups#destroy',
             as: 'group_delete'
      get ':group_id/members',
          to: 'groups#members',
          as: 'group_members',
          constraints: { group_id: /\d+/ }
      get ':group_id/related',
          to: 'groups#related',
          as: 'group_related',
          constraints: { group_id: /\d+/ }
      post ':group_id/members/:user_id',
           to: 'groups#invite',
           as: 'group_invite',
           constraints: { group_id: /\d+/, user_id: /\d+/ }
      post ':group_id/accept',
           to: 'groups#accept_invite',
           as: 'group_accept_invite',
           constraints: { group_id: /\d+/ }
      post ':group_id/refuse',
           to: 'groups#refuse_invite',
           as: 'group_refuse_invite',
           constraints: { group_id: /\d+/ }
      delete ':group_id/members',
             to: 'groups#leave',
             as: 'group_leave',
             constraints: { group_id: /\d+/ }
      delete ':group_id/members/:user_id',
             to: 'groups#kick',
             as: 'group_kick',
             constraints: { group_id: /\d+/, user_id: /\d+/ }
      patch ':group_id/members',
            to: 'groups#settings',
            as: 'group_settings',
            constraints: { group_id: /\d+/ }
    end
  end

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
