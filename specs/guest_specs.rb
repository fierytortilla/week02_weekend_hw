require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new)

require_relative("../guest")

class GuestTest< MiniTest::Test

  def setup()
    @guest1 = Guest.new("Jim Bob", 20, 40, "Cheeky Song")
  end

  def test_get_name_age_cash_favourite_song()
    assert_equal("Jim Bob", @guest1.name)
    assert_equal(20, @guest1.age)
    assert_equal(40, @guest1.cash)
    assert_equal("Cheeky Song", @guest1.favourite_song)
  end

end
