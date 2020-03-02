require("pry-byebug")
require_relative("song.rb")

class Room

  attr_reader :name, :size, :songs

  def initialize(name, size, songs)
    @name= name
    @size= size
    @songs= songs
  end


end
