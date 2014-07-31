require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  it "renders template" do
    usr = FactoryGirl.create(:user)
    get :edit, { :id => usr.id }, {}
    expect(response).to render_template("edit")
  end

end
