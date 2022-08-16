class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.collect {|x| x.content}
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes << Note.find_or_create_by(content: note)
    end
  end
end
