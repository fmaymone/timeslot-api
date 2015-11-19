namespace :migrate_image do
  desc "Copy all User profile images from media_item to User.picture"

  task user: :environment do
    puts "copying image urls to user.picture"

    ActiveRecord::Base.transaction do
      users_count = User.count

      User.find_each.with_index do |user, index|
        default_msg = "#{index + 1}/#{users_count} - #{user.username}"
        image = MediaItem.where(mediable_id: user.id,
                                mediable_type: 'User',
                                deleted_at: nil).take
        unless image
          puts "#{default_msg} has no profile image"
          next
        end
        user.picture = image.public_id
        if user.save
          puts "#{default_msg} profil picture copied"
        else
          puts "#{default_msg} - #{user.image.public_id}"
        end
      end
    end
  end
end
