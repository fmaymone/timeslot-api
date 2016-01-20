if (Rails.env.development? || Rails.env.test?) && ENV['DISABLE_SPRING']

  require 'bullet'

  Rails.application.configure do
    config.after_initialize do
      # Bullet.enable = true
      Bullet.enable = false
      # Bullet.growl = true
      Bullet.raise = true
      # Bullet.alert = true
      # Bullet.bullet_logger = true
      # Bullet.console = true
      # Bullet.growl = true
      # Bullet.xmpp = { :account  => 'bullets_account@jabber.org',
      #                 :password => 'bullets_password_for_jabber',
      #                 :receiver => 'your_account@jabber.org',
      #                 :show_online_status => true }
      Bullet.rails_logger = true
      # Bullet.honeybadger = true
      # Bullet.bugsnag = true
      # Bullet.airbrake = true
      # Bullet.rollbar = true
      # Bullet.add_footer = true
      # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
      # Bullet.stacktrace_excludes = [ 'their_gem', 'their_middleware' ]
      # Bullet.slack = { webhook_url: 'http://some.slack.url', foo: 'bar' }

      # Each of these settings defaults to true

      # Detect N+1 queries
      # Bullet.n_plus_one_query_enable     = false

      # Detect eager-loaded associations which are not used
      Bullet.unused_eager_loading_enable = false

      # Detect unnecessary COUNT queries which could be avoided
      # with a counter_cache
      # Bullet.counter_cache_enable        = false

      Bullet.add_whitelist :type => :n_plus_one_query,
                           :class_name => "User",
                           :association => :location
      Bullet.add_whitelist :type => :n_plus_one_query,
                           :class_name => "MetaSlot",
                           :association => :slots
      Bullet.add_whitelist :type => :n_plus_one_query,
                           :class_name => "User",
                           :association => :memberships

      # Bullet.add_whitelist :type => :n_plus_one_query,
      #                      :class_name => "Post",
      #                      :association => :comments
      # Bullet.add_whitelist :type => :unused_eager_loading,
      #                      :class_name => "Post",
      #                      :association => :comments
      # Bullet.add_whitelist :type => :counter_cache,
      #                      :class_name => "Country",
      #                      :association => :cities
    end
  end

  if defined?(Bullet) && Bullet.enable?
    RSpec.configure do |config|
      puts 'bullet checking for n+1 queries'

      config.before(:each) do
        Bullet.start_request
      end

      config.after(:each) do
        Bullet.perform_out_of_channel_notifications if Bullet.notification?
        Bullet.end_request
      end
    end
  end
end
