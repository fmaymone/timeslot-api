class Search

  def self.new(table, attr, query, page_params = nil)
    return [] if query.length < 3 # 3 chars + 2 special chars: '%123%'
    page = paginate(
        table.where(attr.to_s + ' ILIKE ?', "%" << query.gsub(' ', '%') << "%"),
        attr.to_sym,
        query,
        page_params
    )
    # meta_slots requires change into BaseSlot model for the view part
    if table == MetaSlot && page.empty? == false
      page = page.collect(&:id)
      page = BaseSlot.where(meta_slot_id: page)
    end
    page
  end

  def self.paginate(result, attr, query, page: 1, limit: 100)
    return result if result.empty?
    result.sort{ |a, b| levenshtein(a[attr], query) <=> levenshtein(b[attr], query) }
          .drop((page.to_i - 1) * limit.to_i)
          .take(limit.to_i)
  end

  # http://stackoverflow.com/questions/8619785/what-is-an-efficient-way-to-measure-similarity-between-two-strings-levenshtein
  def self.levenshtein(s1, s2)
    d = {}
    (0..s1.size).each do |row|
      d[[row, 0]] = row
    end
    (0..s2.size).each do |col|
      d[[0, col]] = col
    end
    (1..s1.size).each do |i|
      (1..s2.size).each do |j|
        cost = 0
        if s1[i-1] != s2[j-1]
          cost = 1
        end
        d[[i, j]] = [d[[i - 1, j]] + 1,
                     d[[i, j - 1]] + 1,
                     d[[i - 1, j - 1]] + cost
        ].min
        #next unless @@damerau
        if((i > 1 && j > 1 && s1[i-1]) == (s2[j-2] && s1[i-2])) == s2[j-1]
          d[[i, j]] = [d[[i,j]],
                       d[[i-2, j-2]] + cost
          ].min
        end
      end
    end
    d[[s1.size, s2.size]]
  end
end
