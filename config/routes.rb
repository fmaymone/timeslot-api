Rails.application.routes.draw do

  namespace :v1, defaults: { format: :json } do
    # TODO: rename connect routes
    # scope :connect do
    #   post 'facebook', to: 'connects#facebook_connect'
    #   post 'twitter', to: 'connects#twitter_connect'
    # end
    post 'fb-connect', to: 'connects#facebook_connect'
    post 'tw-connect', to: 'connects#twitter_connect'

    scope constraints: { id: /\d+/ } do
      post 'stdslot', to: 'slots#create_stdslot'
      post 'reslot', to: 'slots#create_reslot'

      patch 'metaslot/:id', to: 'slots#update_metaslot', as: 'metaslot_update'
      patch 'stdslot/:id', to: 'slots#update_stdslot', as: 'stdslot_update'
      patch 'reslot/:id', to: 'slots#update_reslot', as: 'reslot_update'

      delete 'stdslot/:id', to: 'slots#destroy_stdslot', as: 'stdslot_delete'
      delete 'reslot/:id', to: 'slots#destroy_reslot', as: 'reslot_delete'

      get '/', to: 'share#redirect', as: 'redirect'
      post 'share/:id/:action', to: 'share#:action', as: 'slot_share'
      delete 'share/:id', to: 'share#delete', as: 'share_delete'
      post 'export/:id/:action', to: 'export#:action', as: 'slot_export'
      post 'import', to: 'import#handler', as: 'slot_import'
    end

    scope :slots, constraints: { id: /\d+/ } do
      get ':id', to: 'slots#show', as: 'slot'
      post '', to: 'slots#show_many', as: 'slots_read'

      get ':id/likes', to: 'slots#show_likes', as: 'slot_show_likes'
      post ':id/like', to: 'slots#add_like', as: 'slot_add_like'
      delete ':id/like', to: 'slots#unlike', as: 'slot_unlike'

      get ':id/comments', to: 'slots#show_comments', as: 'slot_show_comments'
      post ':id/comment', to: 'slots#add_comment', as: 'slot_add_comment'

      get ':id/slotters', to: 'slots#show_slotters', as: 'slot_show_slotters'
      get ':id/user_tags', to: 'slots#get_user_tags', as: 'slot_get_user_tags'
      post ':id/user_tags', to: 'slots#update_user_tags', as: 'user_tags'

      post ':id/slotgroups', to: 'slots#add_to_groups'
      delete ':id/slotgroups', to: 'slots#remove_from_groups'

      # currently unused
      get ':id/history', to: 'slots#reslot_history', as: 'reslot_history'
      post ':id/copy', to: 'slots#copy', as: 'slot_copy'
      post ':id/move', to: 'slots#move', as: 'slot_move'
    end

    scope :globalslots do
      get 'search', to: 'global_slots#search'
      post 'reslot', to: 'global_slots#create_reslot', as: 'reslot_global_slot'
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
      get 'suggested_users', to: 'me#suggested_users'
      get 'friends', to: 'me#my_friends', as: 'my_friends'
      post 'add_friends', to: 'me#add_friends', as: 'add_friends'
      post 'remove_friends', to: 'me#remove_friends', as: 'remove_friends'
      post 'friendship/:user_id', to: 'me#befriend', as: 'befriend',
           constraints: { user_id: /\d+/ }
      delete 'friendship/:user_id', to: 'me#unfriend', as: 'unfriend',
             constraints: { user_id: /\d+/ }
      patch 'device', to: 'me#update_device', as: 'update_device'
    end

    scope :users, constraints: { id: /\d+/ } do
      get ':id', to: 'users#show', as: 'user'
      post '', to: 'users#create', as: 'user_create'
      post 'signin', to: 'users#signin', as: 'signin'
      post 'reset', to: 'users#reset_password', as: 'reset_password'
      get ':id/slots', to: 'users#slots', as: 'user_slots'
      get ':id/media', to: 'users#media_items', as: 'user_media'
      get ':id/friends', to: 'users#friends', as: 'user_friends'
    end

    scope :groups, constraints: {
            group_uuid: /[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}/i } do
      get '', to: 'groups#index', as: 'groups'
      post '', to: 'groups#create', as: 'group_create'
      get ':group_uuid', to: 'groups#show', as: 'group'
      patch ':group_uuid', to: 'groups#update', as: 'group_update'
      delete ':group_uuid', to: 'groups#destroy', as: 'group_delete'
      get ':group_uuid/slots', to: 'groups#slots', as: 'group_slots'
      get ':group_uuid/members', to: 'groups#members', as: 'group_members'
      get ':group_uuid/related', to: 'groups#related', as: 'group_related'
      post ':group_uuid/members', to: 'groups#invite'
      post ':group_uuid/accept', to: 'groups#accept_invite'
      post ':group_uuid/refuse', to: 'groups#refuse_invite'
      delete ':group_uuid/members', to: 'groups#leave'
      delete ':group_uuid/members/:user_id', to: 'groups#kick',
             constraints: { user_id: /\d+/ }
      patch ':group_uuid/members', to: 'groups#member_settings'
    end

    scope :feed do
      get 'user', to: 'feed#user_feed'
      get 'news', to: 'feed#news_feed'
      get 'notification', to: 'feed#notification_feed'
    end

    if ENV['ENABLE_IOS_DB_CLEAN']
      get 'ios/clean-db', to: 'ios#clean_db'
    end

    get 'search/:action', to: 'search#:action'
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
