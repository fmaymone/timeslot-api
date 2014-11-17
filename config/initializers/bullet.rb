if Rails.env.development? || Rails.env.test?

  require 'bullet'

  Rails.application.configure do
    config.after_initialize do
      Bullet.enable = false
      Bullet.bullet_logger = true
      # Bullet.growl = true
      Bullet.rails_logger = true
      Bullet.raise = true
      # Bullet.airbrake = true
      # Bullet.stacktrace_includes = %w('your_gem', 'your_middleware')
    end
  end
end
