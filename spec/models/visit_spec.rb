require 'rails_helper'

RSpec.describe Visit, :type => :model do

  it "has attribute locatio_id" do
  	v=Visit.new
  	expect(v.has_attribute?(:location_id)).to eq(true)
  end

   it "has attribute user_name" do
  	v=Visit.new
  	expect(v.has_attribute?(:user_id)).to eq(true)
  end

   it "has attribute from_date" do
  	v=Visit.new
  	expect(v.has_attribute?(:from_date)).to eq(true)
  end

  it "has attribute to_date" do
  	v=Visit.new
  	expect(v.has_attribute?(:to_date)).to eq(true)
  end

  it "a valid visit" do

    s2 = Location.create(name: "Los monges", city: "Tarragona", country: "Norway" )
    us7 = User.create( user_name: "walt", name: "juan")

    visit = Visit.create(location_id: s2.id, user_id: us7.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 5.hour)
    expect(visit.valid?).to eq(true)
  end
end

