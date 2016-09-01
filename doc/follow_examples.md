# Follower Model API (Coding Examples)

## Implement Follower

#### Include the Follower Class to a model

```ruby
class Channel < ActiveRecord::Base
  include Follow
  
  ...
  ...
  ...

end
```

## Add Follower

#### Basic Usage (models must include the Follow class):

```ruby
user.follow(self)
```

#### Inversed logic:

```ruby
self.add_follower(user)
```

## Remove Follower

```ruby
user.unfollow(self)
```
```ruby
user.unfollow_all
```

#### Inversed logic:

```ruby
self.remove_follower(user)
```
```ruby
self.remove_all_followers
```

## Get Follower

```ruby
user.followers
```

#### Inversed logic:

```ruby
self.followings
```

## Check follower status

```ruby
user.follows?(self)
user.following?(self)
```

#### Inversed logic:

```ruby
self.followed_by?(user)
```

## Helpers

#### Determine counts:

```ruby
self.followers_count
```
```ruby
user.followings_count
```

#### Determine bi-direktional follow status (e.g. friends):

```ruby
user.follows_each_other
```

#### Determine default sets of followers:

```ruby
user1.followers_intersect(user2) # e.g. same friends only
```
```ruby
user1.followers_subtract(user2)  # e.g. filter out same friends 
```
