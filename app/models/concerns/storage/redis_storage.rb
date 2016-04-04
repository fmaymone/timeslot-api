module RedisStorage
  include Storage

  class << self

    ## -- KEY/VALUE STORAGE MODEL -- ##

    # Stores the passed value to the given index
    def set(index, value)
      $redis.set(index, value)
    end

    # Returns the value stored at the given index
    def get(index)
      $redis.get(index)
    end

    # Returns true if the key already exists
    def exists(index)
      $redis.exists(index)
    end

    # Removes the list at the given index
    def del(index)
      $redis.del(index)
    end

    ## -- ARRAY/LIST STORAGE MODEL -- ##

    # Adds the passed value to the end of the list and returns the new length
    def push(index, value)
      $redis.rpush(index, value)
    end

    # Removes a value from a list stored at the given index
    def remove(index, value)
      $redis.lrem(index, 1, value)
    end

    # Removes all values from a list stored at the given index
    def remove_all(index, value)
      $redis.lrem(index, 0, value)
    end

    # Returns all values from a list stored at the given index
    def range(index, offset = 0, length = -1)
      $redis.lrange(index, offset, length)
    end

    def index(index, position)
      $redis.lindex(index, position)
    end

    # Returns the length of the list at the given index
    def length(index)
      $redis.llen(index)
    end

    ## -- UNIQUE COLLECTION STORAGE MODEL -- ##

    # Adds the passed value to a unique set
    def add_to_set(index, value)
      $redis.sadd(index, value)
    end

    # Removes the passed value from a set
    def remove_from_set(index, value)
      $redis.srem(index, value)
    end

    # Returns all members of the set stored at the given index
    def get_from_set(index)
      $redis.smembers(index)
    end

    # Determine if a value is included in the set stored at the given index
    def set_include?(index, value)
      $redis.sismember(index, value)
    end

    # Returns the length of the set stored at the given index
    def length_of_set(index)
      $redis.scard(index)
    end

    ## -- COLLECTION HELPERS -- ##

    # Determine the intersection of two collections
    def intersect(index1, index2)
      $redis.sinter(index1, index2)
    end

    # Determine the difference of two collections
    def difference(index1, index2)
      $redis.sdiff(index1, index2)
    end

    ## -- I/O HELPERS -- ##

    # Use Transactions if available
    def transaction(&block)
      $redis.multi(&block)
    end

    # Pipelining process if available
    def pipe(&block)
      $redis.pipelined(&block)
    end

    ## -- SYSTEM HELPERS -- ##

    # Returns some informations about usage
    def info
      $redis.info
    end

    # Returns all stored keys
    def keys
      $redis.keys
    end

    # Clear all data
    def flush
      $redis.flushall
    end
  end
end
