class Song < ActiveRecord::Base
  
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def notes_1=(content)
    note = Note.find_or_create_by(content: content)
    if self.notes.length == 0
      self.notes << note
    else
      self.notes[0] = note
    end
  end

  def notes_1
    self.notes.first
  end

  def notes_2=(content)
    note = Note.find_or_create_by(content: content)
    if self.notes.length <= 1
      self.notes << note
    else
      self.notes[1] = note
    end
  end

  def notes_2
    self.notes[1]
  end

  def note_contents
    self.notes.map { |note| note.content }
  end

  def note_contents=(contents)
    self.notes = contents.map { |content| Note.find_or_create_by(content: content)}
  end

end
