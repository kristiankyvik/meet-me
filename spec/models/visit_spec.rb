require 'rails_helper'

RSpec.describe Visit, :type => :model do

  pending "add some examples to (or delete) #{__FILE__}"

	
  it "has attribute locatio_id" do
  	v=Visit.new
  	expect(v.has_attribute?(:location_id)).to eq(true)
  end

   it "has attribute user_name" do
  	v=Visit.new
  	expect(v.has_attribute?(:user_name)).to eq(true)
  end

   it "has attribute from_date" do
  	v=Visit.new
  	expect(v.has_attribute?(:from_date)).to eq(true)
  end

  it "has attribute to_date" do
  	v=Visit.new
  	expect(v.has_attribute?(:to_date)).to eq(true)
  end



end

