module UserQuery
  class Relationship
    def initialize(user_id, other_id = nil)
      @user_id = user_id
      @other_id = other_id
    end

    # prepares a db query to fetch all friends of user
    def my_friends
      make_union(@user_id)
    end

    # prepares a db query to fetch all common friends of user and other
    def common_friends
      circle_a = make_union(@user_id)
      circle_b = make_union(@other_id)
      scope = circle_a.intersect(circle_b)
      User.from(User.arel_table.create_table_alias(scope, :users))
    end

    private def make_union(user_id)
      ut = User.arel_table
      fst = Friendship.arel_table

      established = fst[:deleted_at].eq(nil).and(fst[:state].eq(ESTABLISHED))

      # prepare join statements
      constraint_user = ut.create_on(ut[:id].eq(fst[:user_id]))
      constraint_friend = ut.create_on(ut[:id].eq(fst[:friend_id]))
      join_user = ut.create_join(fst, constraint_user)
      join_friend = ut.create_join(fst, constraint_friend)

      circle_1 = User.joins(join_user).where(fst[:friend_id].eq(user_id).and(established))
      circle_2 = User.joins(join_friend).where(fst[:user_id].eq(user_id).and(established))
      circle_union = circle_1.union(circle_2)
      User.from(ut.create_table_alias(circle_union, :users))
    end
  end
end
