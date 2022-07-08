require 'rails_helper'

RSpec.describe "Writings", type: :request do
  describe "GET /index" do
    it "renders" do
      get "/writings"
      expect(response).to render_template("article/index")
    end
  end
end