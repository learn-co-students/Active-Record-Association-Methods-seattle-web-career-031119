class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    Genre.find_by(id: self.genre_id).name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    #find Drake's id.  Then assign this to the song's artist_id.
    Artist.create(name: "Drake")
    drake_id = Artist.find_by(name: "Drake").id
    self.update(artist_id: drake_id)
    Artist.find_by(id: drake_id)
  end
end
