class Async
  if Rails.env.test?
    def initialize(db: true, wait: false)
      yield
    end
  else
    def initialize(db: true, wait: false)
      if db
        thread = Thread.new do
          begin
            # Register a new connection to the current thread
            ActiveRecord::Base.connection_pool.with_connection do |connection|
              begin
                yield
              rescue => e
                Rails.logger.error { e }
                Airbrake.notify(e)
                puts e
              ensure
                connection.release_connection if connection.active_connection?
                connection.disconnect! if connection.connected?
              end
            end
          ensure
            # NOTE: The default connection pool is related to the current thread
            ActiveRecord::Base.clear_active_connections!
            # Determine current threads through reflection and kill them
            Thread.kill(Thread.current)
          end
        end
      else
        thread = Thread.new do
          begin
            yield
          rescue => e
            Rails.logger.error { e }
            Airbrake.notify(e)
            puts e
          ensure
            # Determine current threads through reflection and kill them
            Thread.kill(Thread.current)
          end
        end
      end
      thread.join if wait
    end
  end
end
