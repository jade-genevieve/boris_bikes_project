require "docking_station"

describe "DockingStation" do
  it "should respond to release a bike" do
    dock = DockingStation.new
    expect(dock).to respond_to(:release_bike)
  end

  it "releases a working bike" do
    dock = DockingStation.new
    bike = dock.release_bike
    expect(bike).to be_working
  end

  it "adds bike to dock" do
    #arrange
    dock = DockingStation.new
    bike = Bike.new

    #act
    dock.dock_bikes(bike)
    result = dock.bikes

    #assert
    expect(result.length).to eq(2)
  end

  it "doesn't release a bike if the dock is empty" do
    #arrange
    dock = DockingStation.new

    #act
    dock.release_bike
    result = dock.release_bike

    #assert
    expect(result).to eq("No bikes left")
  end

  it "should not take more bikes than it can dock" do
    dock = DockingStation.new

    dock.dock_bikes(Bike.new)
    expect { dock.dock_bikes Bike.new }.to raise_error "Docking station full"
  end
end
