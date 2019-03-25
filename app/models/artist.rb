class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    Song.all.first.genre
  end

  def song_count
    Song.where(artist_id: self).count
  end

  def genre_count
    Song.where(artist_id: self).map( &:genre_id ).uniq.count
  end
end
