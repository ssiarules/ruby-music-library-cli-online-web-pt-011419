require "pry"

class Song
  attr_accessor :name, :artist
  attr_accessor :artist, :genre

  @@all = []

     def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre

     end

     def artist=(artist)
       @artist = artist
       artist.add_song(self)
     end

     def self.all
       @@all
     end

     def self.destroy_all
       @@all.clear
     end

     def save
       @@all << self
     end

     def self.create(name)
       #binding.pry
         song = self.new(name)
         song.save
         song
       end

       def genre=(genre)
         @genre = genre
         genre.songs.push self unless genre.songs.include? self 
       end




end
