class Async
  if Rails.env.test?
    def initialize(db: true)
      yield
    end
  else
    def initialize(db: true)
      Thread.new do
        begin
          if db
            # Register a new connection to the current thread
            ActiveRecord::Base.connection_pool.with_connection do |connection|
              begin
                yield
              rescue
              ensure
                connection.release_connection if connection.active_connection?
                connection.disconnect! if connection.connected?
              end
            end
          else
            yield
          end
        rescue
        ensure
          # NOTE: The default connection pool is related to the current thread
          ActiveRecord::Base.clear_active_connections! if db
          # Determine current threads through reflection and kill them
          Thread.kill(Thread.current)
        end
      end
    end
  end
end
