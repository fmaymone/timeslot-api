json.visibility case slot.slot_type
                when 'StdSlotPrivate'
                  'private'
                when 'StdSlotFriends'
                  'friends'
                when 'StdSlotPublic'
                  'public'
                when 'GroupSlotMembers'
                  'members'
                when 'GroupSlotPublic'
                  'public'
                when 'ReSlotFriends'
                  'friends'
                when 'ReSlotPublic'
                  'public'
                else
                  'undefined'
                end
