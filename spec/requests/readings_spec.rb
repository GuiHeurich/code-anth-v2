require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    it "renders" do
      get "/readings"
      expect(response).to render_template("readings/index")
      expect(response.body).to include("code :: anth readings")
    end
  end
end