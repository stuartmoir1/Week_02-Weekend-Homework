require 'minitest/autorun'
require 'minitest/rg'
require_relative '../room'
require_relative '../guest'
require_relative '../song'

class TestRoom < MiniTest::Test

  def setup
    @room = Room.new(1, [], [])
    
    @guest1 = Guest.new('Stuart', 10)
    @guest2 = Guest.new('Nina', 20)
    @guest3 = Guest.new('Leonardo', 0)

    @song1 = Song.new('Season Song')
    @song2 = Song.new('Metro Sound')

  end

  # Test room properties.

  def test_room_number
    assert_equal(1, @room.number)
  end

  def test_room_guests
    assert_equal([], @room.get_guests)
  end

  def test_room_songs
    assert_equal([], @room.get_songs)
  end

  def test_room_capacity
    assert_equal(2, @room.capacity)
  end

  # Test adding and removing guests from room.

  def test_room_check_in
    @room.add_guest(@guest1)
    assert_equal([@guest1], @room.get_guests)
    @room.add_guest(@guest2)
    assert_equal([@guest1, @guest2], @room.get_guests)
  end

  def test_room_check_out
    @room.add_guest(@guest1)
    @room.add_guest(@guest2)
    @room.remove_guest(@guest1)
    assert_equal([@guest2], @room.get_guests)
    @room.remove_guest(@guest2)
    assert_equal([], @room.get_guests)
  end

  def test_room_check_in_full
    @room.add_guest(@guest1)
    @room.add_guest(@guest2)
    assert_equal('Room full', @room.add_guest(@guest3))
  end

  def test_room_check_out_empty
    assert_equal('Room empty', @room.remove_guest(@guest1))
  end

  def test_room_check_out_guest_not_checked_in
    @room.add_guest(@guest1)
    assert_equal('Guest not in room', @room.remove_guest(@guest3))
    assert_equal([@guest1], @room.get_guests)
  end

  # Test adding song to room.

  def test_room_add_song
    @room.add_song(@song1)
    assert_equal([@song1], @room.get_songs)
    @room.add_song(@song2)
    assert_equal([@song1, @song2], @room.get_songs)
  end

  def test_guest_pay_entry_fee_sufficient_monies_guest1
    @guest1.pay_entry_fee(10)
    assert_equal(0, @guest1.get_monies)
  end

  def test_guest_pay_entry_fee_sufficient_monies_guest2
    @guest2.pay_entry_fee(10)
    assert_equal(10, @guest2.get_monies)
  end

  def test_guest_pay_entry_fee_insufficient_monies
    assert_equal('Insufficient monies', @guest3.pay_entry_fee(10))
  end

end