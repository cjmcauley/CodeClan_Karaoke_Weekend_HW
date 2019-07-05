require('minitest/autorun')
require('minitest/rg')

require_relative('../guests')

class TestGuests < MiniTest::Test

  def setup()
    @guest1 = Guests.new('Lauren')
  end

def test_guest_name
  assert_equal('Lauren', @guest1.name)
end


end
