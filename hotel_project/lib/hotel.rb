require_relative "room"
class Hotel
    attr_reader :rooms
  def initialize(str, hash)
    @name = str
    @rooms = Hash.new(0)
        hash.each {|k,v| @rooms[k] = Room.new(v)}
  end
  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end
  def room_exists?(name)
    return true if @rooms.has_key?(name)
    false
  end
  def check_in(person, room_name)
    if !room_exists?(room_name)
        puts 'sorry, room does not exist'
    else
        if @rooms[room_name].add_occupant(person)
        puts 'check in successful'
        else
            puts 'sorry room is full'
        end
    end
  end
  def has_vacancy?
    return false if @rooms.all? { |k,v| v.full?}
    true
  end
  def list_rooms
        @rooms.each {|k, v| puts "#{k} : #{v.available_space}"}
  end
end
