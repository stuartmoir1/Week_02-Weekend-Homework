require 'minitest/autorun'
require 'minitest/rg'
require_relative '../guest'

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new('Stuart', 10)

  end

  # Test guest properties.

  def test_guest_name
    assert_equal('Stuart', @guest.name)
  end

  def test_guest_monies
    assert_equal(10, @guest.get_monies)
  end

end