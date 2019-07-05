class Rooms

  attr_reader :name, :guests, :songs

  def initialize(name)
    @name = name
    @guests = []
    @songs = Hash.new(0)
  end

def add_guest_to_room(guest)
  @guests << guest.name
end






end
