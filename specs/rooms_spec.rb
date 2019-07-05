require('minitest/autorun')
require('minitest/rg')

require_relative('../rooms')
require_relative('../songs')
require_relative('../guests')

class TestRooms < MiniTest::Test

  def setup()
    @room1 = Rooms.new('Disco Room')

    @guest1 = Guests.new('Lauren')
    @guest2 = Guests.new('Fraser')
    @guest3 = Guests.new('Brian')

    @guests = [@guest1.name, @guest2.name, @guest3.name]

  end

  def test_room_name
    assert_equal('Disco Room', @room1.name)
  end

  def test_room_guests
    assert_equal([], @room1.guests)
  end

  def test_room_songs
    assert_equal({}, @room1.songs)
  end

  def test_add_guest_to_room
    assert_equal(['Lauren'], @room1.add_guest_to_room(@guest1))
  end

  def test_add_guests_to_room__multiple
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    assert_equal(@guests, @room1.guests)
  end

end
