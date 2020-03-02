require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

require_relative("../song")

class SongTest< MiniTest::Test

  def setup()
    @song1= Song.new("My Pal Foot Foot")
  end

  def test_song_name
    assert_equal("My Pal Foot Foot", @song1.title)
  end

end
