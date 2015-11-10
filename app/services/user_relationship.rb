class UserRelationship
  def self.call(user_a, user_b)
    return STRANGER if user_a.nil? || user_b.nil?
    return ME if user_a == user_b
    user_a, user_b = User.find [user_a, user_b]
    return FRIEND if user_a.friend_with? user_b
    return FOAF if user_a.common_friend_with? user_b
    STRANGER
  end
end
