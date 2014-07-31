require 'rails_helper'

RSpec.describe VisitsController, :type => :controller do

  before :each do
    @location = Location.create(name: "La Jodida", city: "Begur", country: "Spain" )
    @user = User.create( user_name: "walt", name: "juan")
    @visit = Visit.create(location_id: @location.id, user_id: @user.id, from_date: DateTime.now + 1.hour, to_date: DateTime.now + 2.hours)
  end

  it "Responds get request" do
    get :index,  {:location_id => @location.id}
    expect(response).to be_success
    expect(response).to have_http_status(200)   
  end


  it "renders the index template" do
    get :index,  {:location_id => @location.id}
    expect(response).to render_template("index")   
  end

  it "renders the index with a parameter" do
    get :show,  {:location_id => @location.id, :id => @visit.id}
    expect(assigns(:visit)).to eq(@visit)
  end

  it "id does not belong to existing location, renders error page" do
    get :show,  {:location_id => @location.id, :id => 156}
    expect(response).to render_template("404")
  end

end
