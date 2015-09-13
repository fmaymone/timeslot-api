class StdSlotPolicy < SlotPolicy
  # true if the user is signed in
  def create_stdslot?
    current_user?
  end

  def create_webslot?
    current_user?
  end

  # true if the user is signed in and
  # the user is slot owner
  # meta data? can they only be updated by the creator?
  #
  # concerning performance:
  # StdSlot.unscoped.find(1)
  # SELECT  "std_slots".* FROM "std_slots"  WHERE "std_slots"."id" = $1 LIMIT 1  [["id", 1]]
  # vs > StdSlot.of(aa).find(1)
  # SELECT  "std_slots".* FROM "std_slots"  WHERE "std_slots"."owner_id" = 1 AND "std_slots"."id" = $1 LIMIT 1  [["id", 1]]
  # in the second version the db would be used for business logic, bc it would
  # only return something which is valid
  # in the first version the slot would be fetched but needs to be checked for
  # certain conditions, would be more clear in code but probably less efficient
  def update_stdslot?
    current_user?
    # return false unless current_user?
    # return true if slot.try(:owner) == current_user
    # false
  end

  # true if the user is signed in and
  # the user is slot owner
  def destroy_stdslot?
    current_user?
  end
end
