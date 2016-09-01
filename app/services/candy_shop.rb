require 'open-uri'

class CandyShop
  include TSErrors

  # gets a global slot from the TS_DATA_MALL based on a muid
  def slot(muid)
    raw_result = fetch('slots', muid)
    convert_mall_slot(raw_result)
  end

  # gets a global slot location from TS_DATA_MALL, based on muid
  def location(muid)
    raw_result = fetch('locations', muid)
    CandyLocation.new(raw_result)
  end

  # fetch a global slot category from TS_DATA_MALL
  # and create a user with role 'global_slot_category'
  def category(uuid)
    raw_result = fetch('categories', uuid)
    generated_email = "#{raw_result['string_id'].downcase}@timeslot.com"

    if user = User.find_by(email: generated_email)
      user.update(user_uuid: uuid)
      user.update(username: raw_result['name'])
      user.update(picture: raw_result['image'])
      user.update(role: 'global_slot_category')
    else
      User.create(user_uuid: uuid,
                  username: raw_result['name'],
                  picture: raw_result['image'],
                  role: 'global_slot_category',
                  email: generated_email
                 )
    end
  end

  private def fetch(resource_type, muid)
    uri = URI.parse(ENV['TS_DATA_MALL_URL'])
    uri.path += "#{resource_type}/#{muid}"

    user = ENV['TS_DATA_MALL_NAME']
    pw = ENV['TS_DATA_MALL_PASSWORD']
    auth = { http_basic_authentication: [user, pw] }

    # Never pass unchecked URI to 'open'
    # http://sakurity.com/blog/2015/02/28/openuri.html
    raw_result = open(uri, auth).read
  rescue => e
    if e.class == OpenURI::HTTPError && e.io.status.first == '404'
      raise ActiveRecord::RecordNotFound
    else
      raise DataTeamServiceError.new('CANDY_SHOP', e)
    end
  else
    # I could also pass open(uri, auth) directly to Oj.load, it would then call
    # 'read' on it itself
    result = Oj.load(raw_result)[resource_type]
    result.first
  end

  private def convert_mall_slot(result)
    slot_data = {
      category_uuid: result['category_uuid'],
      meta: {
        title: result['title'],
        start_date: result['start_timestamptz'],
        end_date: result['stop_timestamptz'],
        location_uid: result['location_muid']
      },
      muid: result['muid'],
      url: result['urls'].try(:first),
      # tags: result['tags'], # currently unused
      # domains: result['domains'], # currently unused
      media: [
        {
          public_id: result['images'].try(:first),
          position: 1,
          media_type: "image"
        }
      ]
    }
    if result['description']
      slot_data[:notes] = [
        {
          title: 'Description',
          content: result['description']
        }
      ]
    end
    slot_data
  end
end
