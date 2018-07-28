# As a visitor,
# when I visit a hiking trip's page,
# I can click on the name of a trail
# to see a show page for that specific trail.

require 'rails_helper'

describe 'Visitor' do
  describe 'visits show page' do
    it 'sees a list of all trails associated with this trip' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 123, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 123, address: "sadfldfljkd")

      visit trip_path(trip)

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_1.length)
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_2.length)
      expect(page).to have_content(trail_2.address)
    end
    it 'sees the total hiking distance of all trails on that trip' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 123, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 123, address: "sadfldfljkd")

      expected = trail_1.length + trail_2.length

      visit trip_path(trip)

      expect(page).to have_content(expected)
    end
    it 'sees the average trail length for the trip' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 130, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 120, address: "sadfldfljkd")

      visit trip_path(trip)

      expected = 125

      expect(page).to have_content("Average Trail Length: #{expected}")
    end
    it 'sees the longest trail length for the trip' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 130, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 120, address: "sadfldfljkd")

      visit trip_path(trip)

      expect(page).to have_content("Longest trail: #{trail_1.length}")
    end
    it 'sees the shortest trail for each trip' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 130, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 120, address: "sadfldfljkd")

      visit trip_path(trip)

      expect(page).to have_content("Shortest trail: #{trail_2.length}")
    end
    it "can click on a trail's name to see the show page for that trail" do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 130, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 120, address: "sadfldfljkd")

      visit trip_path(trip)

      click_on trail_1.name

      expect(current_path).to eq(trail_path(trail_1))
    end
  end
end
