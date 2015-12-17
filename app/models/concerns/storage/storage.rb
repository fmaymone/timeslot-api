module Storage
  class << self

    ## -- KEY/VALUE STORAGE MODEL -- ##

    # Stores the passed value to the given index
    def set(index, value)
      raise NotImplementedError,
            "Subclasses must define the method 'set'."
    end

    # Returns the value stored at the given index
    def get(index)
      raise NotImplementedError,
            "Subclasses must define the method 'get'."
    end

    # Removes the list at the given index
    def del(index)
      raise NotImplementedError,
            "Subclasses must define the method 'remove_from_set'."
    end

    ## -- ARRAY/LIST STORAGE MODEL -- ##

    # Adds the passed value to the end of the list and returns the new length
    def push(index, value)
      raise NotImplementedError,
            "Subclasses must define the method 'push'."
    end

    # Removes a value from a list stored at the given index
    def remove(index, value)
      raise NotImplementedError,
            "Subclasses must define the method 'remove'."
    end

    # Removes all values from a list stored at the given index
    def remove_all(index, value)
      raise NotImplementedError,
            "Subclasses must define the method 'remove_all'."
    end

    # Returns all values from a list stored at the given index
    def range(index, offset, length)
      raise NotImplementedError,
            "Subclasses must define the method 'range'."
    end

    def index(index, position)
      raise NotImplementedError,
            "Subclasses must define the method 'index'."
    end

    # Returns the length of the list at the given index
    def length(index)
      raise NotImplementedError,
            "Subclasses must define the method 'length'."
    end

    ## -- UNIQUE COLLECTION STORAGE MODEL -- ##

    # Adds the passed value to a unique set
    def add_to_set(index, value)
      raise NotImplementedError,
            "Subclasses must define the method 'add_to_set'."
    end

    # Removes the passed value from a set
    def remove_from_set(index, value)
      raise NotImplementedError,
            "Subclasses must define the method 'remove_from_set'."
    end

    # Returns all members of the list stored at the given index
    def get_from_set(index)
      raise NotImplementedError,
            "Subclasses must define the method 'get_from_set'."
    end

    # Determine if a value is included in the list stored at the given index
    def set_include?(index, value)
      raise NotImplementedError,
            "Subclasses must define the method 'set_include?'."
    end

    # Returns the length of the set stored at the given index
    def length_of_set(index)
      raise NotImplementedError,
            "Subclasses must define the method 'length_of_set'."
    end

    ## -- COLLECTION HELPERS -- ##

    # Determine the intersection of two collections
    def intersect(index1, index2)
      raise NotImplementedError,
            "Subclasses must define the method 'sinter'."
    end

    # Determine the difference of two collections
    def difference(index1, index2)
      raise NotImplementedError,
            "Subclasses must define the method 'sdiff'."
    end

    ## -- I/O HELPERS -- ##

    # Returns all stored keys
    def keys
      raise NotImplementedError,
            "Subclasses must define the method 'keys'."
    end

    # Clear all data
    def flush
      raise NotImplementedError,
            "Subclasses must define the method 'flush'."
    end

    # Returns some informations about usage
    def info
      'no info available'
    end

    # Use Transactions if available
    def transaction(&block)
      call(&block)
    end

    # Pipelining process if available
    def pipe(&block)
      call(&block)
    end

    private def error_handler(error, message, params = nil)
      opts = {}
      opts[:parameters] = { message: message }
      opts[:parameters][:params] = params if params
      Rails.logger.error { error }
      Airbrake.notify(error, opts)
    end
  end
end
