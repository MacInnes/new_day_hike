require 'rails_helper'

describe 'Visitor' do
  describe 'visits trip index page' do
    it 'can see a list of all trip names' do
      trip_1 = Trip.create(name:"asdf")
      trip_2 = Trip.create(name:"aasdf")
      trip_3 = Trip.create(name:"asdfasdfdf")

      visit trips_path

      expect(page).to have_link(trip_1.name)
      expect(page).to have_link(trip_2.name)
      expect(page).to have_link(trip_3.name)
    end
    it 'can click on the name of a trip to see a show page' do
      trip_1 = Trip.create(name:"asdf")
      trip_2 = Trip.create(name:"aasdf")
      trip_3 = Trip.create(name:"asdfasdfdf")

      visit trips_path

      click_link(trip_1.name)

      expect(current_path).to eq(trip_path(trip_1))
      expect(page).to have_content(trip_1.name)
    end
  end
end

# As a visitor,
# when I visit the hiking trips index page,
# and I click on the name of a hiking trip,
# I see a unique page for that hiking trip.
