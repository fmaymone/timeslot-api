class UserRelationship
  def self.call(user_a, user_b)
    return 'stranger' if user_a.nil? || user_b.nil?
    return 'himself' if user_a == user_b
    user_a, user_b = User.find [user_a, user_b]
    return 'friend' if user_a.friend_with? user_b
    'stranger'
  end
end
