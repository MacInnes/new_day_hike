require 'rails_helper'

describe 'Visitor' do
  describe 'visits trail show page' do
    it 'sees all trips associated with this trail' do
      trail = Trail.create(name: "asasdfkj", length: 123, address: "2398423asdfsf")

      trip_1 = trail.trips.create(name: "asdf")
      trip_2 = trail.trips.create(name: "kjfkjddf")

      visit trail_path(trail)

      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)
    end
    it 'sees the total number of trips for this trail' do
      trail = Trail.create(name: "asasdfkj", length: 123, address: "2398423asdfsf")

      trip_1 = trail.trips.create(name: "asdf")
      trip_2 = trail.trips.create(name: "kjfkjddf")
      trip_3 = trail.trips.create(name: "fkjhdf")

      visit trail_path(trail)

      expect(page).to have_content("Total trips: 3")
    end
  end
end
