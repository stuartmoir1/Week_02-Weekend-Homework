class Viewer

  def enter_room_number
    while true
      print 'Room number [\'1\' or \'2\']: '
      room = gets.chomp.to_i
      # Reprompt until appropriate response given.
      if (room == 1) || (room == 2)
        return room
      end
    end
  end
  
  def enter_action(room_number)
    while true
      print "Room #{room_number} - add or remove guests ['a' or 'r']: "
      action = gets.chomp.downcase
      # Reprompt until appropriate response given.
      if (action == 'a') || (action == 'r')
        return action
      end
    end
  end

  def display_room(room)
    puts room
    print "Room #{room.number}: "
    # room.get_guests == [] ? (print "no guests\n") : (print room.get_guests)
    room.get_guests == [] ? (print "no guests") : room.guests.each { |guest| print guest }
    puts
  end

  def add_guests(room)
    while true
      display_room(room)
      print "Add guest to Room #{room.number} ['q' to quit]: "
      name = gets.chomp.capitalize
      if name == 'Q'
        return
      else
        guest = Guest.new(name, 0)
        room.add_guest(guest)
      end
    end
  end

end