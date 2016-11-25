Rails.application.routes.draw do
  root 'application#root'

  namespace :v1, defaults: { format: :json } do
    # TODO: rename connect routes
    # scope :connect do
    #   post 'facebook', to: 'connects#facebook_connect'
    #   post 'twitter', to: 'connects#twitter_connect'
    # end
    post 'fb-connect', to: 'connects#facebook_connect'
    post 'tw-connect', to: 'connects#twitter_connect'

    scope constraints: { id: /\d+/ } do
      # share routes
      get '/', to: 'share#redirect', as: 'redirect'
      post 'share/:id/:action', to: 'share#:action', as: 'slot_share'
      delete 'share/:id', to: 'share#delete', as: 'share_delete'
      post 'export/:action', to: 'export#:action', as: 'slot_export'
      post 'import', to: 'import#handler', as: 'slot_import'

      # TODO: remove routes
      patch 'stdslot/:id', to: 'slots#update_stdslot', as: 'stdslot_update'
      delete 'stdslot/:id', to: 'slots#delete', as: 'stdslot_delete'
      patch 'metaslot/:id', to: 'slots#update_metaslot', as: 'metaslot_update'
    end

    scope :slots, constraints: { id: /\d+/ } do
      get ':id', to: 'slots#show', as: 'slot'
      post '', to: 'slots#create', as: 'slot_create'
      patch ':id', to: 'slots#update', as: 'slot_update'
      delete ':id', to: 'slots#delete', as: 'slot_delete'

      delete ':id/media', to: 'slots#delete_media', as: 'delete_media'
      delete ':id/notes', to: 'slots#delete_notes', as: 'delete_notes'

      get ':id/likes', to: 'slots#show_likes', as: 'slot_show_likes'
      post ':id/like', to: 'slots#add_like', as: 'slot_add_like'
      delete ':id/like', to: 'slots#unlike', as: 'slot_unlike'

      get ':id/comments', to: 'slots#show_comments', as: 'slot_show_comments'
      post ':id/comment', to: 'slots#add_comment', as: 'slot_add_comment'

      get ':id/slotters', to: 'slots#show_slotters', as: 'slot_show_slotters'
      get ':id/user_tags', to: 'slots#show_tagged_users', as: 'show_tagged_users'
      post ':id/user_tags', to: 'slots#tag_users', as: 'tag_users_to_slot'

      get ':id/slotsets', to: 'slots#slotsets'
      post ':id/slotgroups', to: 'slots#add_to_groups'
      delete ':id/slotgroups', to: 'slots#remove_from_groups'

      # currently unused
      get ':id/history', to: 'slots#reslot_history', as: 'reslot_history'
    end

    scope :globalslots do
      get 'search', to: 'search#global_slots'
      post 'reslot', to: 'global_slots#create_reslot', as: 'reslot_global_slot'
    end

    get 'media-signature', to: 'media#create_signature'

    scope :me do
      root 'me#show', as: 'show_me'
      patch '', to: 'me#update', as: 'update_me'
      delete '', to: 'me#inactivate', as: 'inactivate_me'
      get 'slots', to: 'me#my_slots', as: 'my_slots'
      get 'schedule', to: 'me#schedule'
      post 'schedule/calendar/:uuid', to: 'me#add_calendar_to_schedule'
      delete 'schedule/calendar/:uuid', to: 'me#remove_calendar_from_schedule'
      get 'friendslots', to: 'me#slots_of_my_friends'
      get 'media', to: 'me#my_media_items', as: 'my_media'
      get 'signout', to: 'me#signout', as: 'sign_me_out'
      get 'suggested_users', to: 'me#suggested_users'
      get 'friends', to: 'me#my_friends', as: 'my_friends'
      get 'calendars', to: 'me#calendars'
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
      post 'public', to: 'users#create_public', as: 'user_create_public'
      post 'signin', to: 'users#signin', as: 'signin'
      post 'reset', to: 'users#reset_password', as: 'reset_password'
      get ':id/slots', to: 'users#slots', as: 'user_slots'
      get ':id/media', to: 'users#media_items', as: 'user_media'
      get ':id/friends', to: 'users#friends', as: 'user_friends'
      get ':id/calendars', to: 'users#calendars'
      get ':id/dates', to: 'users#dates'
    end

    scope :groups,
          constraints: {
            group_uuid: /[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}/i } do
      post '', to: 'groups#create', as: 'group_create'
      get ':group_uuid', to: 'groups#show', as: 'group'
      patch ':group_uuid', to: 'groups#update', as: 'group_update'
      delete ':group_uuid', to: 'groups#destroy', as: 'group_delete'
      get ':group_uuid/slots', to: 'groups#slots', as: 'group_slots'
      get ':group_uuid/dates', to: 'groups#dates'
      get ':group_uuid/members', to: 'groups#members', as: 'group_members'
      get ':group_uuid/related', to: 'groups#related', as: 'group_related'
      post ':group_uuid/members', to: 'groups#invite'
      post ':group_uuid/accept', to: 'groups#accept_invite'
      post ':group_uuid/refuse', to: 'groups#refuse_invite'
      delete ':group_uuid/members', to: 'groups#leave'
      delete ':group_uuid/members/:user_id', to: 'groups#kick',
             constraints: { user_id: /\d+/ }
      patch ':group_uuid/members', to: 'groups#member_settings'
      post 'global_group', to: 'groups#global_group'
    end

    scope :calendars,
          constraints: {
            slotgroup_uuid: /[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}/i } do
      post ':slotgroup_uuid/subscribe', to: 'groups#subscribe'
    end

    scope :search do
      get ':action', to: 'search#:action'
    end

    get 'discover', to: 'feed#discovery_feed'

    scope :feed do
      get 'user', to: 'feed#user_feed'
      get 'news', to: 'feed#news_feed'
      get 'notification', to: 'feed#notification_feed'
      get 'request', to: 'feed#request_feed'
      get 'discovery', to: 'feed#discovery_feed'
    end

    scope :invitecodes do
      post '', to: 'invitecodes#create'
      get ':code', to: 'invitecodes#show'
    end

    scope :maintenance do
      root 'maintenances#health'
      get 'clientversions', to: 'maintenances#clientversions'
      get 'clean-db', to: 'maintenances#clean_db' if ENV['ENABLE_IOS_DB_CLEAN'] == 'true'
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
