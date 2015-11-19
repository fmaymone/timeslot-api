class MediaCollector
  def initialize(current_user: nil, other_user:)
    @current_user = current_user
    @other_user = other_user
  end

  def all_media_items(user:)
    MediaItem.where(creator: user)
  end

  def retrieve
    # determine relation to current_user
    relationship = UserRelationship.call(@current_user.try(:id), @other_user.id)

    return all_media_items(user: @current_user) if relationship == ME

    # get slot collections which include showable media_items
    collections = PresentableMediaItems.call(relationship: relationship,
                                             current_user: @current_user,
                                             user: @other_user)
    medias = []

    # collect media_items from all slots of all allowed collections
    collections.each do |slots|
      # TODO: optimize performance
      slots.find_each do |slot|
        medias += slot.media_items
      end
    end

    # erstmal mit dem Holzhammer:
    # remove all media_items which aren't created by the relevant user
    medias.reject! { |item| item.creator_id != @other_user.id }

    medias.sort_by(&:created_at)
  end
end
