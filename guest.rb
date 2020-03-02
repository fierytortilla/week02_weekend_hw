require_relative('song.rb')

class Guest

  attr_reader :name, :age, :favourite_song
  attr_accessor :cash

  def initialize(name, age, cash, favourite_song)
    @name= name
    @age = age
    @cash= cash
    @favourite_song= favourite_song
  end


end
