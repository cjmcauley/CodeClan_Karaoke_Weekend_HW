require('minitest/autorun')
require('minitest/rg')

require_relative('../rooms')
require_relative('../songs')
require_relative('../guests')

class TestRooms < MiniTest::Test

  def setup()

    @room1 = Rooms.new('Disco Room', 4, 100)

    @guest1 = Guests.new('Lauren', 50, 'Proud Mary')
    @guest2 = Guests.new('Fraser', 40, 'Stereo')
    @guest3 = Guests.new('Brian', 60, 'Crabs in a bucket')
    @guest4 = Guests.new('Nicola', 40, 'Stereo')

    @guests = [@guest1, @guest2, @guest3]

    @song1 = Songs.new('Proud Mary', 'Tina Turner')
    @song2 = Songs.new('Stereo', 'Pavement')
    @song3 = Songs.new('Crabs in a Bucket', 'Vince Staples')

    @songs = [@song1, @song2, @song3]

  end

  def test_room_name
    assert_equal('Disco Room', @room1.name)
  end

  def test_room_guests
    assert_equal([], @room1.guests)
  end

  def test_room_no_of_guests
    assert_equal(0, @room1.no_of_guests)
  end

  def test_room_songs
    assert_equal([], @room1.songs)
  end

  def test_check_in_guest_to_room__single
    @room1.check_in_guest_to_room(@guest1, @room1)
    assert_equal([@guest1], @room1.guests)
  end

  def test_check_in_guests_to_room__multiple
    @room1.check_in_guest_to_room(@guest1, @room1)
    @room1.check_in_guest_to_room(@guest2, @room1)
    @room1.check_in_guest_to_room(@guest3, @room1)
    assert_equal(@guests, @room1.guests)
  end

  def test_add_song_to_room__single
    assert_equal(1, @room1.add_song_to_room(@song1))
  end

  def test_add_song_to_room__multiple
    @room1.add_song_to_room(@song1)
    @room1.add_song_to_room(@song2)
    @room1.add_song_to_room(@song3)
    assert_equal(3, @room1.songs.length)
  end

  def test_add_and_remove_guests
    @room1.check_in_guest_to_room(@guest1, @room1)
    @room1.check_in_guest_to_room(@guest2, @room1)
    @room1.check_in_guest_to_room(@guest3, @room1)
    @room1.remove_guest_from_room(@guest2)
    assert_equal(2, @room1.no_of_guests)
  end

  def test_check_room_capacity
    assert_equal(4, @room1.capacity)
  end

  def test_if_room_at_capacity_nobody_else_added
    @room1.check_in_guest_to_room(@guest1, @room1)
    @room1.check_in_guest_to_room(@guest2, @room1)
    @room1.check_in_guest_to_room(@guest3, @room1)
    @room1.check_in_guest_to_room(@guest3, @room1)
    @room1.check_in_guest_to_room(@guest3, @room1)
    assert_equal(4, @room1.capacity)
  end

  def test_increase_till
    @room1.increase_till
    assert_equal(110, @room1.till)
  end

  def test_increase_till_reduce_wallet
    @room1.increase_till_reduce_wallet(@room1, @guest1)
    assert_equal(110, @room1.till)
    assert_equal(40, @guest1.wallet)
  end

  def test_full_transaction
    @room1.check_in_guest_to_room(@guest1, @room1)
    @room1.check_in_guest_to_room(@guest2, @room1)
    @room1.check_in_guest_to_room(@guest3, @room1)
    @room1.check_in_guest_to_room(@guest4, @room1)
    @room1.check_in_guest_to_room(@guest3, @room1)
    assert_equal(4, @room1.capacity)
    assert_equal(140, @room1.till)
    assert_equal(40, @guest1.wallet)
    assert_equal(30, @guest2.wallet)
    assert_equal(50, @guest3.wallet)
    assert_equal(30, @guest4.wallet)
  end

  def test_guest_reaction__favourite_song
    @room1.add_song_to_room(@song1)
    assert_equal('Whoo', @room1.favourite_song(@guest1))
  end

  def test_guest_reaction__no_favourite_song
    @room1.add_song_to_room(@song2)
    assert_nil(nil, @room1.favourite_song(@guest1))
  end

end
