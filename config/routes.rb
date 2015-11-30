Rails.application.routes.draw do

  namespace :v1, defaults: { format: :json } do
    post 'fb-connect', to: 'connects#facebook_connect'
    post 'tw-connect', to: 'connects#twitter_connect'

    get 'slots/:id', to: 'slots#show', as: 'slot', constraints: { id: /\d+/ }
    post 'slots', to: 'slots#show_many', as: 'slots_read'
    get 'slots/demo', to: 'slots#show_last', as: 'slots_last'

    post 'stdslot', to: 'slots#create_stdslot'
    post 'reslot', to: 'slots#create_reslot'
    post 'groupslot', to: 'slots#create_groupslot'
    post 'webslot', to: 'slots#create_webslot'

    patch 'metaslot/:id', to: 'slots#update_metaslot', as: 'metaslot_update'
    patch 'stdslot/:id', to: 'slots#update_stdslot', as: 'stdslot_update'
    patch 'groupslot/:id', to: 'slots#update_groupslot', as: 'groupslot_update'
    patch 'reslot/:id', to: 'slots#update_reslot', as: 'reslot_update'

    delete 'stdslot/:id', to: 'slots#destroy_stdslot', as: 'stdslot_delete'
    delete 'groupslot/:id', to: 'slots#destroy_groupslot', as: 'groupslot_delete'
    delete 'reslot/:id', to: 'slots#destroy_reslot', as: 'reslot_delete'

    get 'slots/:id/share',
        to: 'slots#share_url',
        as: 'slot_shareurl',
        constraints: { id: /\d+/ }
    get 'slots/:uid/sharedata',
        to: 'slots#share_data',
        as: 'slot_sharedata'
    get 'slots/:id/likes',
        to: 'slots#show_likes',
        as: 'slot_show_likes',
        constraints: { id: /\d+/ }
    post 'slots/:id/like',
         to: 'slots#add_like',
         as: 'slot_add_like',
         constraints: { id: /\d+/ }
    delete 'slots/:id/like',
           to: 'slots#unlike',
           as: 'slot_unlike',
           constraints: { id: /\d+/ }
    post 'slots/:id/comment',
         to: 'slots#add_comment',
         as: 'slot_add_comment',
         constraints: { id: /\d+/ }
    get 'slots/:id/comments',
        to: 'slots#show_comments',
        as: 'slot_show_comments',
        constraints: { id: /\d+/ }
    get 'slots/:id/slotters',
        to: 'slots#show_slotters',
        as: 'slot_show_slotters',
        constraints: { id: /\d+/ }
    get 'slots/:id/history',
        to: 'slots#reslot_history',
        as: 'reslot_history',
        constraints: { id: /\d+/ }
    post 'slots/:id/copy',
         to: 'slots#copy',
         as: 'slot_copy',
         constraints: { id: /\d+/ }
    post 'slots/:id/move',
         to: 'slots#move',
         as: 'slot_move',
         constraints: { id: /\d+/ }

    scope :globalslots do
      get 'search', to: 'global_slots#search'
    end

    get 'media-signature', to: 'media#create_signature'

    scope :me do
      get '', to: 'me#show', as: 'show_me'
      patch '', to: 'me#update', as: 'update_me'
      delete '', to: 'me#inactivate', as: 'inactivate_me'
      get 'slots', to: 'me#my_slots', as: 'my_slots'
      get 'friendslots', to: 'me#slots_of_my_friends'
      get 'media', to: 'me#my_media_items', as: 'my_media'
      get 'signout', to: 'me#signout', as: 'sign_me_out'
      post 'add_friends', to: 'me#add_friends', as: 'add_friends'
      post 'remove_friends', to: 'me#remove_friends', as: 'remove_friends'
      post 'friendship/:user_id',
           to: 'me#befriend',
           as: 'befriend',
           constraints: { id: /\d+/ }
      delete 'friendship/:user_id',
             to: 'me#unfriend',
             as: 'unfriend',
             constraints: { id: /\d+/ }
      patch 'device', to: 'me#update_device', as: 'update_device'
    end

    scope :users do
      get ':id', to: 'users#show', as: 'user', constraints: { id: /\d+/ }
      post '', to: 'users#create', as: 'user_create'
      post 'signin', to: 'users#signin', as: 'signin'
      post 'reset', to: 'users#reset_password', as: 'reset_password'
      get ':user_id/slots',
          to: 'users#slots',
          as: 'user_slots',
          constraints: { id: /\d+/ }
      get ':user_id/media',
          to: 'users#media_items',
          as: 'user_media',
          constraints: { id: /\d+/ }
    end

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
      get ':group_id/slots',
          to: 'groups#slots',
          as: 'group_slots',
          constraints: { group_id: /\d+/ }
      get ':group_id/members',
          to: 'groups#members',
          as: 'group_members',
          constraints: { group_id: /\d+/ }
      get ':group_id/related',
          to: 'groups#related',
          as: 'group_related',
          constraints: { group_id: /\d+/ }
      post ':group_id/members',
           to: 'groups#invite',
           as: 'group_invite'
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
            to: 'groups#member_settings',
            as: 'group_member_settings',
            constraints: { group_id: /\d+/ }
    end

    scope :feed do
      get 'user', to: 'feed#user_feed'
      get 'news', to: 'feed#news_feed'
      get 'notification', to: 'feed#notification_feed'
    end

    if ENV['ENABLE_IOS_DB_CLEAN']
      get 'ios/clean-db', to: 'ios#clean_db'
    end

    get 'search', to: 'search#index'
    get 'search/:action', to: 'search#:action'
    get 'locations/search', to: 'locations#search'
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
