require 'rails_helper'

RSpec.describe LocationsController, :type => :controller do
	before :each do
		@location = Location.create(name: "La Jodida", city: "Begur", country: "Spain" )

	end

	describe "Get #Show command" do
		it "Responds succesfully to request get" do
			get :show, {:id => @location.id}
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "renders the index template" do
			get :show, {:id => @location.id}
			expect(response).to render_template("show")
		end

		it "renders the index with a parameter" do
			get :show, {:id => @location.id}
			expect(assigns(:location)).to eq(@location)
		end

		it "id does not belong to existing location, renders error page" do
			get :show,  {:id => 156}
			expect(response).to render_template("404")
		end
	end
end

