require 'rails_helper'

RSpec.describe User, :type => :model do
  it "fails with unvalid username (with space)" do
    user = User.new(user_name: "jdk ds", name: "ben")
    expect(user.valid?).to eq(false)
  end

  it "fails with unvalid username (with symbol)" do
    user = User.new(user_name: "jdk$ds", name: "ben")
    expect(user.valid?).to eq(false)
  end

  it "succeeds with valid username" do
    user = User.new(user_name: "krist34", name: "ben")
    expect(user.valid?).to eq(true)
  end

  it "does not succeed with invalid username" do
    user =  FactoryGirl.build(:user_with_visits)
    inv_user =  FactoryGirl.build(:invalid_user)
    expect(user.valid?).to eq(true)
    expect(inv_user.valid?).to eq(false)
  end

end
