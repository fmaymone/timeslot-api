namespace :recalculate_counters do
  desc "Updates the counter cache columns."

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

  task baseslot: :environment do
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
end
