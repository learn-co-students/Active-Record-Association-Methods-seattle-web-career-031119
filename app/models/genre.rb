class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    Song.where(genre_id: self).count
  end

  def artist_count
    Song.where(genre_id: self).map(&:artist_id).uniq.count
  end

  def all_artist_names
    array = Song.all.map(&:artist_id).uniq
    names = []
    array.each {|art_id|
    names << Artist.find_by(id: art_id).name}
    names
  end
end
