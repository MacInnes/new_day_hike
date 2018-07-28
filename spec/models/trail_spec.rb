require 'rails_helper'

describe Trail do
  describe 'model methods' do
    it 'shows the total number of trips for that trail' do
      trail = Trail.create(name: "asasdfkj", length: 123, address: "2398423asdfsf")

      trip_1 = trail.trips.create(name: "asdf")
      trip_2 = trail.trips.create(name: "kjfkjddf")
      trip_3 = trail.trips.create(name: "fkjhdf")

      expect(trail.total_trips).to eq(3)
    end
  end
end
