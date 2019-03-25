class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    Song.first.genre
  end

  def song_count
    #return the number of songs associated with the artist
    Song.where(artist_id: self).count
  end

  def genre_count
    #return the number of genres associated with the artist
    Song.where(artist_id: self).map(&:genre_id).uniq.count
  end
end
