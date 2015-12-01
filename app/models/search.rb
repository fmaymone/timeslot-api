class Search
  def self.new(table, attr, query, page: 1, limit: 10, method: 'metaphone')
    # NOTE: Actually we skip the minimum length check of the users query string
    # We should re-enable this later to prevent from performance issues,
    # or we can use the users from the activity feeds shared object to speed up user search
    return [] if query.empty?
    result = paginate(
      send(method, table, attr, query),
      attr,
      query,
      page.to_i,
      limit.to_i
    )

    # meta_slots requires change into BaseSlot model for the view part
    # @twi: I changed this bc using baseslots here would mean you can search for
    # all private slots from other users so I think until we have a system in
    # place to filter the results we should only send results which are fine no
    # matter what
    # btw BaseSlots are not intended to be rendered via json, please see note
    # in the beginning of the class
    if (table == MetaSlot) && result
      result = StdSlotPublic.where(meta_slot_id: result.ids)
    end
    result
  end

  def self.equal(table, attr, query)
    table.where(attr + ' = ?', query)
  end

  def self.like(table, attr, query)
    table.where(attr + ' ILIKE ?', '%' << query.tr(' ', '%') << '%')
  end

  def self.soundex(table, attr, query)
    table.where('soundex(' + attr + ') = soundex(?)', query)
  end

  def self.difference(table, attr, query)
    table.where("difference(" + attr + ", ?) > 1", query)
  end

  def self.metaphone(table, attr, query)
    table.where('metaphone(' + attr + ', 1) = metaphone(?, 1)', query)
  end

  def self.levenshtein(table, attr, query)
    table.where('levenshtein(' + attr + ', ?) > 5', query)
  end

  # requires: postgres extension "pg_trgm"
  # this algorithm is very slow but is often favourized by the community
  # def self.similiar(table, attr, query)
  #   table.where('similarity(' + attr + ', ?) < 5', query)
  # end

  def self.paginate(result, attr, query, page, limit)
    return nil unless result.exists?

    result.offset((page - 1) * limit)
      .limit(limit)
      .order("levenshtein(" + attr + ", '" + query + "') ASC, " + attr)
  end
end
