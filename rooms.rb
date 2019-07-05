class Rooms

  attr_reader :name, :guests, :songs, :capacity

  def initialize(name, capacity)
    @name = name
    @guests = []
    @songs = []
    @capacity = capacity
  end

def check_in_guest_to_room(guest)
  @guests << guest
end

def no_of_guests
  return @guests.length
end

def add_song_to_room(song)
  @songs << song
end

def remove_guest_from_room(guest)
  @guests.delete(guest)
end

def check_capacity(guest)
  if capacity > guests.length
    check_in_guest_to_room(guest)
  else
    return "Room at capacity"
  end
end


end
