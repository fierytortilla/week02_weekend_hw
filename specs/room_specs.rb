require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

require_relative("../room.rb")
require_relative("../song.rb")

class RoomTest< MiniTest::Test

  def setup()
    @song1= Song.new("My Pal Foot Foot")
    @song2= Song.new("Philosophy of the World")
    @song3= Song.new("Who are Parents")
    @song4= Song.new("That Little Sports Car")
    @song5= Song.new("My Companion")
    @song6= Song.new("I'm So Happy When You're Near")
    @song7= Song.new("Things I Wonder")
    @song8= Song.new("Sweet Thing")
    @song9= Song.new("It's Halloween")
    @song10= Song.new("Why Do I Feel?")
    @song11= Song.new("What Should I Do?")
    @song12= Song.new("We Have a Savior")
    @songs= [@song1, @song2, @song3, @song4, @song5, @song6, @song7, @song8, @song9, @song10, @song11, @song12]
    @room1 = Room.new("The Shaggs Room", 10, @songs)
  end

  def test_room_name_and_size()
    assert_equal("The Shaggs Room", @room1.name)
  end

end
