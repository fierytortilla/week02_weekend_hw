require('minitest/autorun')
require('minitest/reporters')
require('pry-byebug')
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

require_relative("../karaoke_bar.rb")
require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class KaraokeBarTest< MiniTest::Test

  def setup()
    @guest1 = Guest.new("Jim Bob", 20, 40, "Master of Puppets")
    @guest2 = Guest.new("Bob Jim", 21, 20, "Cheeky Song")
    @guest3 = Guest.new("James Bob", 22, 10, "Skinwalker")
    @guest4 = Guest.new("Robert Jim", 19, 30, "My Pal Foot Foot")
    @guest5 = Guest.new("Jimmy Jim Bobby Bob", 69, 60, "My Way")
    @guests= [@guest1, @guest2, @guest3, @guest4, @guest5]

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

    @song13= Song.new("Mambo No. 5")
    @songs2= [@song13]
    @room2= Room.new("Actual Hell", 1, @songs2)

    @rooms= {@room1=> nil, @room2=> nil}
    @karaoke_bar1= Karaoke_Bar.new("Kerry Okie's Karoake Bar", @rooms, 15)
  end

  def test_karoake_bar_name_and_rooms
    assert_equal("Kerry Okie's Karoake Bar", @karaoke_bar1.name)
    assert_equal(2, @karaoke_bar1.rooms.count())
    assert_equal(15, @karaoke_bar1.entry_fee)
  end

  def test_checking_in_guests_underage
    @guests.push(Guest.new("Hubert", 15, 20, "Lil Misdemeanor"))
    @karaoke_bar1.check_in_guests(@guests, @room1)
    assert_equal(0, @karaoke_bar1.till)
    assert_nil(@karaoke_bar1.rooms[@room1])
  end

  def test_checking_in_guests
    @karaoke_bar1.check_in_guests(@guests, @room1)
    assert_equal(75, @karaoke_bar1.till)
    assert_equal(@guests, @karaoke_bar1.rooms[@room1])
  end

  def test_checking_in_guests_too_many
    @karaoke_bar1.check_in_guests(@guests, @room2)
    assert_equal(0, @karaoke_bar1.till)
    assert_nil(@karaoke_bar1.rooms[@room2])
  end

  def test_checking_out_guests
    @karaoke_bar1.check_in_guests(@guests, @room1)
    @karaoke_bar1.check_out_guests(@room1)
    assert_equal(75, @karaoke_bar1.till)
    assert_equal(nil, @karaoke_bar1.rooms[@room1])
  end

  def test_count_guests_cash
    assert_equal(160, @karaoke_bar1.count_guests_cash(@guests))
  end

  def test_make_new_room
    @karaoke_bar1.make_new_room("Also Hell", 1, @songs2)
    assert_equal("Also Hell", @rooms.keys.last.name)
  end

  def test_remove_room
    @karaoke_bar1.remove_room("Actual Hell")
    assert_nil(@rooms[@room2])
  end

  def test_guest_finds_his_favourite_song()
    assert_equal("Whoo", @karaoke_bar1.guest_finds_his_favourite_song(@guests, @room1))
  end

  def test_guest_finds_his_favourite_song()
    assert_equal("Oh ok", @karaoke_bar1.guest_finds_his_favourite_song(@guests, @room2))
  end

end
