require 'minitest/autorun'
require 'minitest/rg'
require_relative '../song'

class TestSong < MiniTest::Test

  def setup
    @song = Song.new('Season Song')
  
  end

  # Test song properties.

  def test_song_name
    assert_equal('Season Song', @song.name)
  end

end