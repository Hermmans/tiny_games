class Room
    attr_reader :capacity, :occupants
    def initialize(number) 
        @capacity = number
        @occupants = []
    end
    def full?
        return false if @occupants.length < @capacity
        true
    end
    def available_space
        @capacity - @occupants.length
    end
    def add_occupant(person_name)
        if !full?
            @occupants << person_name   
            return true
        else 
            return false
        end
    end
end
