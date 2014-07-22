require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do


	it "Repsonds succesfully to request get" do
		loc=Location.create()
		get :show,  {:id => loc.id}
		expect(response).to be_success
		expect(response).to have_http_status(200)		
	end


	it "renders the index template" do
		loc=Location.create()
		get :show,  {:id => loc.id}
		expect(response).to render_template("show")		
	end

	it "renders the index with a patameter" do
		loc=Location.create()
		get :show,  {:id => loc.id}
		expect(assigns(:location)).to eq(loc)
	end

	it "id does not belong to existing location, renders error page" do
		loc=Location.create()
		get :show,  {:id => 156}
		expect(response).to render_template("404")
	end


end

