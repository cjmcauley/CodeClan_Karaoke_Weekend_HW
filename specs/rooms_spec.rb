require('minitest/autorun')
require('minitest/rg')

require_relative('../rooms')

class TestRooms < MiniTest::Test

  def setup()
    @room1 = Rooms.new('Disco Room')
  end

def test_room_name
  assert_equal('Disco Room', @room1.name)
end


end
