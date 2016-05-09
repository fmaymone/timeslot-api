# Activity Feed API (Coding Examples)

## Implement Activity

#### Define an custom Activity Class (inherits from Activity)

```ruby
module DeviceActivity
  include Activity

  private def activity_type
    'Device'
  end
  
  private def activity_target
    self
  end

  private def activity_actor
    self.user
  end
  
  private def activity_visibility
    'private'
  end
end
```

#### Include an custom Activity Class to a model

```ruby
class Device < ActiveRecord::Base
  include DeviceActivity
  
  def delete
    update_activity('unplug')
  end
  
  ...
  ...
  ...
  
  ## Activity Methods ##
  
  # Inherits or override attributes from super class

  private def activity_action
    'plug'
  end

  private def activity_visibility
    'public'
  end
end
```

## Distribute Activities

#### Basic Usage (model must include an activity class):

```ruby
create_activity
```

```ruby
# User does not include an activity class
like = slot.create_like(self) # self = current_user
like.create_activity
```

#### Custom Usage:

```ruby
create_activity('unlike')
```

```ruby
create_activity('like', 
  fwd: {
    User: [current_user.id.to_s],
    News: [slot.followers],
    Notification: [slot.creator.id.to_s]
  },
  push: [slot.creator.id]
)
```

## Remove Activities

#### Basic Usage (model must include an activity class):

```ruby
remove_activity
```

#### Remove and distribute deletion activity:

```ruby
remove_activity
create_activity('delete')

# The same as:
update_activity('delete')
```

## Reduce Activity-to-Feed Distribution

#### Current Solution (Pseudo-Code):

```ruby
context_before = determine_current_context(actor, target)
do: change_social_context
context_after = determine_current_context(actor, target)
reduce_context = context_before - context_after # as "social diff"
remove_activity_from(reduce_context)
```

#### Reduce Distribution Example (Async):

```ruby
def inactivate
  remove_activity
  reduce_distribution_by{
    group.remove_follower(user)
    ts_soft_delete
  }
end
```

#### Reduce Distribution Example (Inline):

```ruby
  reduce_distribution_by(async: false){
    group.remove_follower(user)
    ts_soft_delete
  }
```

#### Core functionality:

```ruby
RemoveJob.perform_later(
    # Activity-related reduction
    activity: { ... },
     # Target-related reduction
    target: { ... },
    # User-related reduction
    user: { ... },
    # Group-related reduction
    group: { ... },
    # Friendship-related reduction
    friends: { ... }
)
```

## Helpers

#### Asynchronous-Code-Execution:

When access to the DB pool is required (default):
```ruby
Async.new do
    # do some code in its own dedicated thread
end
```

When access to the DB pool is not required:
```ruby
Async.new(db: false) do
    # do some code in its own dedicated thread
end
```
