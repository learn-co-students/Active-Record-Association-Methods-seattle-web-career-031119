class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    Song.where(genre_id: self).count
  end

  def artist_count
    # return the number of artists associated with the genre
    Song.where(genre_id: self)
    .map( &:artist_id )
    .uniq
    .count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    names = []
    artist_ids = Song.all.map(&:artist_id).uniq
    artist_ids.each do |aid|
      names << Artist.find_by(id: aid).name
    end
    names
  end
end
