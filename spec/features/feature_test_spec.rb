require "airport"
require "plane"
require 'spec_helper'
require 'capybara/rspec'

feature "Airport Challenge feature test" do

  before :all do
    @airport=Airport.new
    @p1=Plane.new
    @p2=Plane.new
    @p3=Plane.new
    @p4=Plane.new
    @p5=Plane.new
  end

  scenario "User lands plane if space and good weather - simple case" do
    airport = @airport
    allow(airport).to receive(:report_weather).and_return(:sunny)
    expect(airport.land_plane(@p1)).to include(@p1)
  end

  scenario "Busy day at airport - step-by-step" do
    airport = @airport
    allow(airport).to receive(:report_weather).and_return(:sunny)

    expect(@p1.status).to eq(:landed)
    expect{airport.launch_plane(@p2)}.to raise_error 'Plane is not here'
    airport.land_plane(@p3)
    airport.land_plane(@p4)
    expect(airport.land_plane(@p5)).to include(@p1, @p3, @p4, @p5)
    expect(airport.launch_plane(@p1)).to include(@p3, @p4, @p5)
    expect(@p3.status).to eq(:landed)
    expect(@p1.status).to eq(:flying)
  end

end
