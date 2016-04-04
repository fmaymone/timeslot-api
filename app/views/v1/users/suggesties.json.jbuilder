# this template is used for suggested users,
# the way they are retrieved should make sure that the friendship_state is 'stranger'
# TODO: wrap array in hash
json.array!(@users) do |user|
  json.partial! 'v1/users/user', user: user
  json.friendship_state 'stranger'
end
