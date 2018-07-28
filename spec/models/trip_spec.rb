require 'rails_helper'

describe Trip do
  describe "model methods" do
    it 'can calculate the total trail length' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 123, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 123, address: "sadfldfljkd")

      expected = trail_1.length + trail_2.length

      expect(trip.total_trail_length).to eq(expected)
    end
    it 'can calculate the average of each trail length' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 200, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 100, address: "sadfldfljkd")

      expected = (trail_1.length + trail_2.length) / 2

      expect(trip.average_trail_length).to eq(expected)
    end
    it 'can calculate the longest trail for that trip' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 200, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 100, address: "sadfldfljkd")

      expect(trip.longest_trail).to eq(trail_1.length)
    end
    it 'can calculate the shortest trail for each trip' do
      trip = Trip.create(name: "adsf")

      trail_1 = trip.trails.create(name: "asasdfkj", length: 200, address: "2398423asdfsf")
      trail_2 = trip.trails.create(name: "asfd", length: 100, address: "sadfldfljkd")

      expect(trip.shortest_trail).to eq(trail_2.length)
    end
  end
end
