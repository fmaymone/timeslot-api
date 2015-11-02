namespace :migrate_image do
  desc "Copy all User profile images from media_item to User.picture"

  task user: :environment do
    puts "copying image urls to user.picture"

    ActiveRecord::Base.transaction do
      users_count = User.count

      User.find_each.with_index do |user, index|
        default_msg = "#{index + 1}/#{users_count} - #{user.username}"
        unless user.image
          puts "#{default_msg} has no profile image".cyan
          next
        end
        user.picture = user.image.public_id
        if user.save
          puts "#{default_msg} profil picture copied".green
        else
          puts "#{default_msg} - #{user.image.public_id}".red
        end
      end
    end
  end
end
