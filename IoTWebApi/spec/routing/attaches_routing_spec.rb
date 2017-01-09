require "rails_helper"

RSpec.describe AttachesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/attaches").to route_to("attaches#index")
    end

    it "routes to #new" do
      expect(:get => "/attaches/new").to route_to("attaches#new")
    end

    it "routes to #show" do
      expect(:get => "/attaches/1").to route_to("attaches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/attaches/1/edit").to route_to("attaches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/attaches").to route_to("attaches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/attaches/1").to route_to("attaches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/attaches/1").to route_to("attaches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/attaches/1").to route_to("attaches#destroy", :id => "1")
    end

  end
end
