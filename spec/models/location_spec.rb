require 'rails_helper'

RSpec.describe Location, :type => :model do

	xit "retreives last correctly" do
    # TODO test of this method
	end

  it "retreives visits of specified month" do
    s6 = Location.create(name: "COrner", city: "Corcho", country: "Germany" )
    us1 = User.create( user_name: "pepito", name: "quillo")
    vis1 = Visit.create(location_id: s6.id, user_id: us1.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
    vis2 = Visit.create(location_id: s6.id, user_id: us1.id, from_date: DateTime.now + 1.months, to_date: DateTime.now + 2.months)
    expect(s6.total_visits_in_month_of_year(7, 2014)).to eql(1)
  end
end

