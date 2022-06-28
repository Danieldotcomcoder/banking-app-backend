require "rails_helper"

RSpec.describe CashesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cashes").to route_to("cashes#index")
    end

    it "routes to #show" do
      expect(get: "/cashes/1").to route_to("cashes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cashes").to route_to("cashes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cashes/1").to route_to("cashes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cashes/1").to route_to("cashes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cashes/1").to route_to("cashes#destroy", id: "1")
    end
  end
end
