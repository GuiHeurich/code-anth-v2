require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_attributes) {
    {
      username: "code-anth",
      password: "Xyz45673!"
    }
  }

  let(:invalid_attributes) { 
    {
      username: "code-anth",
      password: "abcdasjhasuhkasuhkdaskuhkasduh"
    }

}

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user = User.create! valid_attributes
      get user_url(user)
      follow_redirect!
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new user" do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end
    end
  end
end