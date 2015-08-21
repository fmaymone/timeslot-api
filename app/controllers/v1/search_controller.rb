class V1::SearchController < ApplicationController

  def index
    # default route to "v1/search/"
    # here we can add multi search
    head :error
  end

  def users
    authorize :search

    if(search = search_params)
      render json: User.where('username LIKE ? OR email LIKE ?', search, search)
                       .sort{ |a,b| levenshtein(a, b) }.reverse
    else
      render json: {}
    end
  end

  def slots
    authorize :search

    if(search = search_params)
      render json: MetaSlot.where('title LIKE ?', search)
                       .sort{ |a,b| levenshtein(a, b) }.reverse
    else
      render json: {}
    end
  end

  def media
    authorize :search

    if(search = search_params)
      render json: MediaItem.where('title LIKE ?', search)
                       .sort{ |a,b| levenshtein(a, b) }.reverse
    else
      render json: {}
    end
  end

  private def search_params
    return false if params.require(:query).length < 3
    #params.require(:include, :exclude) unless params[:filter].present?
    #params.permit(:private, :public, :group) unless params[:scope].present?
    #params.permit(:query, :filter, :scope).symbolize_keys
    "%" << params[:query] << "%"
  end

  #http://stackoverflow.com/questions/8619785/what-is-an-efficient-way-to-measure-similarity-between-two-strings-levenshtein
  private def levenshtein(s1, s2)
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
        if(s1[i-1] != s2[j-1])
          cost = 1
        end
        d[[i, j]] = [d[[i - 1, j]] + 1,
                     d[[i, j - 1]] + 1,
                     d[[i - 1, j - 1]] + cost
        ].min
        next unless @@damerau
        if(i > 1 && j > 1 && s1[i-1] == s2[j-2] && s1[i-2] == s2[j-1])
          d[[i, j]] = [d[[i,j]],
                       d[[i-2, j-2]] + cost
          ].min
        end
      end
    end
    return d[[s1.size, s2.size]]
  end
end
