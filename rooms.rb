class Rooms

  attr_reader :name, :guests, :songs, :capacity, :entry_fee
  attr_accessor :till

  def initialize(name, capacity, till)
    @name = name
    @guests = []
    @songs = []
    @capacity = capacity
    @entry_fee = 10
    @till = till
  end

  def check_in_guest_to_room(guest, room)
    if capacity > guests.length
      @guests << guest
      increase_till_reduce_wallet(room, guest)
    end
  end

  def no_of_guests
    return @guests.length
  end

  def add_song_to_room(song)
    song = {:title => song.title, :artist => song.artist}
    @songs << song
    return songs.length
  end

  def remove_guest_from_room(guest)
    @guests.delete(guest)
  end

  def increase_till
    @till += entry_fee
  end

  def increase_till_reduce_wallet(room, guest)
    increase_till
    guest.charge_guest(room)
  end

  def favourite_song(guest)
    if @songs.any? { |songs| songs[:title] == guest.fav_song }
      return 'Whoo'
    end
    return
  end

end
