class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    Artist.first.songs[0].genre
    #return the genre of the artist's first saved song
  end

  def song_count
    # binding.pry
    self.songs.count
    #return the number of songs associated with the artist
  end

  def genre_count
    count = 0
    songs = self.songs[0]
    genres = songs.genre
    if genres.class != Array
      count+=1
    end
    # self.songs.each do |song|

    #   if !!song.genre == true
    #     count ++
    #   else
    #     puts "No genre"
    #   end
    # end
    count
    #return the number of genres associated with the artist
  end
end
