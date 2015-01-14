class ReorderMedia
  def self.call(media_items)
    return false unless valid_sorting? media_items

    media_items.each do |item|
      MediaItem.find(item[:media_id]).update(position: item[:position])
    end
    true
  end

  def self.valid_sorting?(parameter)
    arr = parameter.map { |i| i[:position].to_i }
    no_gaps = arr.size > arr.max
    dups = arr.find { |e| arr.rindex(e) != arr.index(e) }
    dups.nil? && no_gaps
  end
end
