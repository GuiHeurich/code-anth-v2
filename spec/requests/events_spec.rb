require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    it "renders" do
      get "/events"
      expect(response).to render_template("events/index")
    end
  end
end