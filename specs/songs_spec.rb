require('minitest/autorun')
require('minitest/rg')

require_relative('../songs')

class TestSongs < MiniTest::Test

  def setup()
    @song1 = Songs.new('Proud Mary', 'Tina Turner')
  end

def test_song_name
  assert_equal('Proud Mary', @song1.title)
end

def test_song_
  assert_equal('Tina Turner', @song1.artist)
end

end
