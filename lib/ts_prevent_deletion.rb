module TSPreventDeletion
  class NotActivated < StandardError; end
  class AssociationNotDeleted < StandardError; end

  def ts_soft_delete
    update(deleted_at: Time.zone.now)
    check_associations_for_delete_state
  end

  def destroy
    prevent_remove unless self.class == Device
  end

  def delete
    prevent_remove
  end

  private def prevent_remove
    msg = { prevent_deletion: "Deletion was prevented for object: #{self}" }
    msg.merge!(caller_0: caller[0])
    msg.merge!(caller_1: caller[1])
    msg.merge!(caller_2: caller[2])
    Rails.logger.error msg
    fail NotActivated, msg
  end

  private def check_associations_for_delete_state
    associated_entities = collect_associations self

    associated_entities.flatten.each do |item|
      next if item.deleted_at?
      error_string = "#{item} wasn't deleted (but should) when deleting #{self}"
      msg = { error_message: error_string }
      Rails.logger.error error_string
      Airbrake.notify(AssociationNotDeleted, msg)
      fail AssociationNotDeleted, msg if Rails.env.test? || Rails.env.development?
    end

    true
  end

  private def collect_associations(deleted_obj)
    associated_entities = []

    # look into all associations of the object to be deleted
    deleted_obj.class.reflect_on_all_associations.each do |assoc|
      if assoc.macro == :belongs_to
        # ignore belongs_to because the don't reference the object
        next
      elsif assoc.options[:through]
        # ignore '(has many) through' associations
        next
      else
        # collect all rows which reference the object to be deleted
        ass_class = get_assoc_class assoc
        fk = assoc.foreign_key.to_sym
        associated_entities << ass_class.where(fk => deleted_obj.id)
      end
    end

    associated_entities
  end

  private def get_assoc_class(a)
    a.options[:class_name] || a.name.to_s.classify.constantize
  end
end
