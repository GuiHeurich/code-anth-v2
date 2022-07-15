require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    it "renders" do
      get "/contact"
      expect(response).to render_template("contact/index")
    end
  end
end