class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    song == nil ? Song.create_by_name(name) : song
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    parsed = filename.split(/ - |.mp3/)
    song = Song.new_by_name(parsed[1])
    song.artist_name = parsed[0]
    song
  end

  def self.create_from_filename(filename)
    parsed = filename.split(/ - |.mp3/)
    song = Song.create_by_name(parsed[1])
    song.artist_name = parsed[0]
    song
  end

  def self.destroy_all
    Song.all.clear
  end

end
