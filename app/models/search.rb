class Search

  def self.new(table, attr, query, page: 1, limit: 10, method: :metaphone)
    return [] if query.length < 3
    result = paginate(
        self.method(method.to_sym).call(table, attr, query),
        attr,
        query,
        page.to_i,
        limit.to_i
    )
    # meta_slots requires change into BaseSlot model for the view part
    if table == MetaSlot && result.empty? == false
      result = result.collect(&:id)
      result = BaseSlot.where(meta_slot_id: result)
    end
    result
  end

  def self.equal(table, attr, query)
    table.where(attr + ' = ?', query)
  end

  def self.like(table, attr, query)
    table.where(attr + ' ILIKE ?', '%' << query.gsub(' ', '%') << '%')
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
  # def self.similiar(table, attr, query)
  #   table.where('similarity(' + attr + ', ?) < 5', query)
  # end

  def self.paginate(result, attr, query, page, limit)
    return result if result.empty?
    result.limit(limit)
          .offset((page - 1) * limit)
          .select("*", "levenshtein(" + attr + ", '" + query + "') AS distance")
          .order("distance ASC, " + attr)
  end
end
