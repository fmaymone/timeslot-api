##Temporary space to collect knowledge on the app functionality and workflows

# Users

# social signup/signin/connect

When a User has a 'normal' timeslot account (signup via email/pw) and in parallel
a social-signup account (e.g. via facebook) it is not possible to merge them.
Same applies if someone wants to add an email address to an account, and the
email is already used for another account, the action will fail.

When a user signs up via facebook and we can recognize the email address, the
accounts should be merged.

# Slots
## ReSlots

### general things

A reslot has own set of media items, notes, likes and comments. This set is on the parent slot.
Everyone who has reslotet this slot can see all those same data.
If s/he adds new content, every other slotter can also see this content.

If s/he want's to add stuff not viewable by all other slotters she
can COPY the slot into onw of her categories and add new stuff there.

### The act of Resloting

As a rule of thumb: (Re-)Slotting makes only sense for slots that are not yours.

You can reslot public slots. They will be public afterwards. (Maybe we
add a choose list so one can decide if he wants the reslot in a special list)

You can reslot friends slots. They will be visible to your friends afterwards.


It is only possible to reslot public slots or friendslots from friends.
It's not possible to reslot Groupslots, they can only be copied (and in some cases moved-> probably not).
This might only be true for private groups, because if you can see a slot in a private/standard group than it means
you are already a member of the group and so the slot is yours anyway.
But for public groups this is not true. You should be allowed to reslot groupslots from public groups imho.
Maybe we shouldn't be too restrictive here, what if I erroneously put a slot into friendsvisible.
I must to be able to change it...

A reslot is visible to everybody if the original/parent slot is public.
A reslot is visible to the users friends if the original/parent slot a friendslot.

### Reslot History

- wenn der owner des parent slots inaktiviert wird, wird er im slot auf unknown gesetzt
- wenn der parentslot geloescht wird -> noch nicht entschieden

## Copy Slot
- possible into several targets at once
    - [private_slots/friend_slots/public_slots/groups I'm allowed to post to]
- always copies media data and notes
- never copies likes and comments

## Move Slot
- can only move slot to one target
    - [private_slots/friend_slots/public_slots]
    - ReSlots should not be a move-to target, maybe they can be a source
- always moves media data and notes
- never moves likes and comments, they will be lost (except if moving from reslots, because likes and comments still exist on the parent)
- can only move own slots (my own private, own friends and own public slots and my own reslots)
- a slot can not be moved out of a group
- move slot is especially useful for importet slots (apple calender etc.)
- the visibility must stay the same (private) or increase

# App Screens
## Me Page / My Slots

- list of my own private/friends/public slots + my reslots + all slots from the groups I participate

## Me Page / Friends

- List of all friend-visible and public slots from my friends

# Add a slot

- can only create one slot at once

### Idee von Kaweh zum interface
- bei der auswahlliste welche slots angezeigt werden 2 neue kategorien
    - friendslots from friends
    - public slots from friends

- eine andere idee die ich gerade habe
    - slots created by me als eigene liste verfuegbar machen
    - slots die von mir erstellt wurden in der liste zb der friendslots farblich auszeichnen
