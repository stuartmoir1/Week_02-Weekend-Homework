class Room

  attr_reader :capacity, :guests, :number

  def initialize(number, guests, songs)
    @capacity = 2
    @guests = guests
    @number = number
    @songs = songs
  end

  def get_guests
    @guests
  end

  def get_songs
    @songs
  end

  def add_guest(guest)
    @guests.count < @capacity ? @guests.push(guest) : 'Room full'
  end

  def remove_guest(guest)
    return 'Room empty' if @guests.empty?
    @guests.find { |i| i == guest } != nil ? @guests.delete(guest) : 'Guest not in room'
  end

  def add_song(song)
    @songs.push(song)
  end

end