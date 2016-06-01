class PresentableSlots
  # returns all slot collections current_user is allowed to see from some other
  # user depending on their specific relationship
  def self.call(relationship:, user:, current_user: nil)
    case relationship
    when ME
      # Eigentlich kann man sich 'user.std_slots' sparen, denn
      # fuer jeden slot, den ein user erzeugt, wird ein passengership
      # erzeugt, welches in 'user.related_slots' enthalten ist.
      # Die specs muessen aber noch aktualisiert werden und da duplicates
      # gefiltert werden, aendert sich das Resultat nicht, kostet jedoch mehr.
      # [user.std_slots, # checkt den owner, besser waere es, den metaslot
       # creator zu checken, aber kommt momentan aufs gleiche raus
      [user.related_slots,
       user.group_slots]
    when FRIEND
      # includes public, friend-visible and friend-of-friend (foaf) visible
      # std_slots, slots from public groups and
      # slots from shared groups (between user and current_user)
      # [user.std_slots.unprivate,
       # user.my_calendar_slots.unprivate,
      [user.related_slots.unprivate,
       user.public_group_slots,
       current_user.shared_group_slots(user)]
    when FOAF # not used
      # includes public and friend-of-friend (foaf) visible std_slots,
      # slots from public groups and
      # slots from shared groups (between user and current_user)
      [user.std_slots_public,
       user.std_slots_foaf,
       user.my_calendar_slots.public,
       user.public_group_slots,
       current_user.shared_group_slots(user)]
    when STRANGER
      # includes public std_slots created by user, slots in public groups
      # and slots from common groups of user and current_user
      # [user.std_slots_public,
       # user.my_calendar_slots.public,
      [user.related_slots.public,
       user.public_group_slots,
       current_user.shared_group_slots(user)]
    when VISITOR
      # includes public std_slots created by user and slots from public groups
      # [user.std_slots_public,
       # user.my_calendar_slots.public,
       [user.related_slots.public,
        user.public_group_slots]
    end
  end

  def self.std_slots(relationship:, user:)
    case relationship
    when ME
      [user.std_slots]
    when FRIEND
      [user.std_slots.unprivate]
    when FOAF
      [user.std_slots_public, user.std_slots_foaf]
    when STRANGER, VISITOR
      [user.std_slots_public]
    end
  end
 end
