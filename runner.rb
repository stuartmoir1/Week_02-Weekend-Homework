require 'minitest/autorun'
require 'minitest/rg'
require 'pry'
require_relative './room'
require_relative './guest'
require_relative './song'
require_relative './viewer'

class CodeClanCaraoke

  def initialize(viewer)

    @viewer = viewer

    @room1 = Room.new(1, [], [])
    @room2 = Room.new(2, [], [])

    @song1 = Song.new('The Leaves Were Falling')
    @song2 = Song.new('Because I\'m Me')
    @song3 = Song.new('Frankie Sinatra')
    @song4 = Song.new('Subways')
    @song5 = Song.new('Going Home')

  end

  def run

    caraoke = CodeClanCaraoke.new(Viewer.new)

    puts @room1
    puts @room2

    room_number = @viewer.enter_room_number
    room_number == 1 ? room = @room1 : room = @room2
    action = @viewer.enter_action(room_number)

    if action == 'a'
      @viewer.add_guests(room)
      puts room.get_guests, puts
    elsif action == 'r'
      # remove_guests(room)    
    else
      # TBC
    end

  end

end

caraoke =  CodeClanCaraoke.new(Viewer.new)
caraoke.run