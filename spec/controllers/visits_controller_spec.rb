require 'rails_helper'

RSpec.describe VisitsController, :type => :controller do

  it "Responds get request" do
    loc= Location.create
    get :index,  {:location_id => loc.id}
    expect(response).to be_success
    expect(response).to have_http_status(200)   
  end


  it "renders the index template" do
    loc=Location.create()
    get :index,  {:location_id => loc.id}
    expect(response).to render_template("index")   
  end

  it "renders the index with a parameter" do
    loc=Location.create()
    vis=Visit.create()
    vis.location=loc
    get :show,  {:location_id => loc.id, :id => vis.id}
    expect(assigns(:visits)).to eq(vis)
  end

  it "new method return an array of user id" do
    s1=Location.create(name: "El pillao", city: "Girona", country: "Spain" )
    visit = Visit.new()
    us1 = User.create( user_name: "pepito", name: "quillo")
    get :new,  {:user => loc.id, :id => vis.id}
        expect(assigns(:visits)).to eq(vis)
  end

  # it "id does not belong to existing location, renders error page" do
  #   loc=Location.create()
  #   get :show,  {:id => 156}
  #   expect(response).to render_template("404")
  # end
    

end
