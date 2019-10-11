require "bike"

class DockingStation
  attr_reader :bikes
  # attr_accessor :bikes

  def initialize
    @bikes = [Bike.new]
  end

  def release_bike
    if @bikes.size > 0
      @bikes.pop
    else
      "No bikes left"
    end
  end

  def dock_bikes(bike)
    @bikes.push(bike)
  end

  #   def docked_bikes
  #     @bikes
  #   end

  def see_docked_bikes
    puts @bikes
  end
end
