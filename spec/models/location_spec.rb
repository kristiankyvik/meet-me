require 'rails_helper'

RSpec.describe Location, :type => :model do

	it "retireves first elemnt by id" do
		loc=Location.create
		puts loc.id
		expect(Location.finder(loc.id)).to eq(Location.find(loc.id))
		
	end

	it "retrives last correctly" do
		loc=Location.create(name: "hola")
		loc=Location.create(name: "comoestas")
		loc=Location.create(name: "comoesadasdstas")
		expect(Location.last_created(2)).to eq(Location.order("created_at ASC").limit(2))
		
	end



end

