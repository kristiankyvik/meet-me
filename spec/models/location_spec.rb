require 'rails_helper'

RSpec.describe Location, :type => :model do

	# it "retireves first elemnt by id" do
	# 	loc=Location.create
	# 	puts loc.id
	# 	expect(Location.finder(loc.id)).to eq(Location.find(loc.id))
		
	# end

	it "retrives last correctly" do
		loc=Location.create(name: "hola")
		loc=Location.create(name: "comoestas")
		loc=Location.create(name: "comoesadasdstas")
		expect(Location.last_created(2)).to eq(Location.order("created_at ASC").limit(2))
		
	end

  it "retreives visits of specfied mpnth" do
    loc=Location.create(name: "ola q ase")
    vis1=Visit.create(location_id: loc.id, from_date: DateTime.new(2000,1, 15), to_date: DateTime.new(2000, 2, 15) )
    vis2=Visit.create(location_id: loc.id, from_date: DateTime.now + 2.month, to_date: DateTime.now + 3.month)

    expect(loc.total_visits_in_month_of_year(1, 2000)).to eql(1)

  end

end

