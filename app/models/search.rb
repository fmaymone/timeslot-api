class Search

  def self.new(table, attr, query, page: 1, limit: 10)
    return [] if query.length < 3

    page = paginate(
        difference(table, attr, query),
        attr.to_sym,
        query,
        page,
        limit
    )

    # meta_slots requires change into BaseSlot model for the view part
    if table == MetaSlot && page.empty? == false
      page = page.collect(&:id)
      page = BaseSlot.where(meta_slot_id: page)
    end
    page
  end

  def self.basic(table, attr, query)
    table.where(attr.to_s + ' ILIKE ?', "%" << query.gsub(' ', '%') << "%")
  end

  def self.soundex(table, attr, query)
    table.where('soundex(' + attr.to_s + ') = soundex(?)', query)
  end

  def self.difference(table, attr, query)
    table.where("difference(" + attr.to_s + ", ?) > 1", query)
  end

  def self.metaphone(table, attr, query)
    table.where('metaphone(' + attr.to_s + ', 1) = metaphone(?, 1)', query)
  end

  def self.levenshtein(table, attr, query)
    table.select("*", "levenshtein('#{attr.to_s}', '#{query}')")
  end

  # requires: postgres extension "pg_trgm"
  # def self.similiar(table, attr, query)
  #   table.select("*", "similarity(title, #{ActiveRecord::Base.sanitize(query)}) AS similarity")
  #        .order('similarity DESC, title')
  # end

  def self.paginate(result, attr, query, page, limit)
    return result if result.empty?
    result#.sort{ |a, b| _levenshtein(a[attr], query) <=> _levenshtein(b[attr], query) }
          .drop((page.to_i - 1) * limit.to_i)
          .take(limit.to_i)
          .sort{ |a, b| distance(a[attr], query) <=> distance(b[attr], query) }
  end

  # http://stackoverflow.com/questions/8619785/what-is-an-efficient-way-to-measure-similarity-between-two-strings-levenshtein
  def self.distance(s1, s2)
    d = {}
    (0..s1.size).each do |row|
      d[[row, 0]] = row
    end
    (0..s2.size).each do |col|
      d[[0, col]] = col
    end
    (1..s1.size).each do |i|
      (1..s2.size).each do |j|
        cost = (s1[i-1] != s2[j-1] ? 1 : 0)
        d[[i, j]] = [d[[i - 1, j]] + 1,
                     d[[i, j - 1]] + 1,
                     d[[i - 1, j - 1]] + cost].min
        if((i > 1 && j > 1 && s1[i-1]) == (s2[j-2] && s1[i-2])) == s2[j-1]
          d[[i, j]] = [d[[i,j]],
                       d[[i-2, j-2]] + cost].min
        end
      end
    end
    d[[s1.size, s2.size]]
  end
end
