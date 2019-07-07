require('minitest/autorun')
require('minitest/rg')

require_relative('../guests')
require_relative('../rooms')

class TestGuests < MiniTest::Test

  def setup()

    @guest1 = Guests.new('Lauren', 40, 'Proud Mary')

    @room1 = Rooms.new('Disco Room', 4, 100)

  end

  def test_guest_name
    assert_equal('Lauren', @guest1.name)
  end

  def test_guest_wallet
    assert_equal(40, @guest1.wallet)
  end

  def test_guest_charged
    @guest1.charge_guest(@room1)
    assert_equal(30, @guest1.wallet)
  end

  def test_guest_fav_song
    assert_equal('Proud Mary', @guest1.fav_song)
  end

end
