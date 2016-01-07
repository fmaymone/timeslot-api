namespace :slots do

  desc "Sets the type column for the existing slots in the db."
  task set_type: :environment do
    puts "Going through all slots and set the type..."

    ActiveRecord::Base.transaction do
      slot_count = BaseSlot.count

      BaseSlot.find_each.with_index do |slot, index|
        default_msg = "#{index + 1}/#{slot_count} - #{slot.title}"

        if slot.type
          puts "#{default_msg} has type set"
          next
        end

        # Just saving the record is enough because of the temporary 'before_save'
        # callback in BaseSlot.

        # new_type = slot.slot_type

        # if new_type.to_s == 'ReSlot'
        #   new_type = 'ReSlotPublic'
        # end

        # slot.type = new_type

        if slot.save
          puts "#{default_msg} updated (#{slot.type})"
        else
          puts "ERROR - #{default_msg} not updated (#{slot.type})"
        end
      end
    end
  end

  desc "Recalculating counter caches columns for Like, Comment, ReSlots on BaseSlot table."
  task refresh_counters: :environment do
    puts "Recalculating counter caches for Like, Comment, ReSlots on BaseSlot table."
    Rails.application.eager_load!

    counter_cached = [Like, Comment, ReSlot]

    counter_cached.each do |many_class|
      many_class.reflections.each do |_name, reflection|
        next unless reflection.options[:counter_cache]
        one_table, many_table = [BaseSlot, many_class].map(&:table_name)
        ids = BaseSlot
              .joins(many_table.to_sym)
              .group("#{one_table}.id")
              .having("#{one_table}.#{many_table}_count != COUNT(#{many_table}.id)")
              .pluck("#{one_table}.id")
        ids.each do |id|
          BaseSlot.reset_counters id, many_table
        end
      end
    end
  end

  # task all: :environment do
  #   puts "Recalculation counter caches on all tables."
  #   Rails.application.eager_load!

  #   ActiveRecord::Base.descendants.each do |many_class|
  #     many_class.reflections.each do |name, reflection|
  #       if reflection.options[:counter_cache]
  #         one_class = reflection.class_name.constantize
  #         one_table, many_table = [one_class, many_class].map(&:table_name)
  #         ids = one_class
  #               .joins(many_table.to_sym)
  #               .group("#{one_table}.id")
  #               .having("#{one_table}.#{many_table}_count != COUNT(#{many_table}.id)")
  #               .pluck("#{one_table}.id")
  #         ids.each do |id|
  #           one_class.reset_counters id, many_table
  #         end
  #       end
  #     end
  #   end
  # end
end
