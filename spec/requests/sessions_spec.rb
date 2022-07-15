require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { User.create(
    username: "code-anth",
    password: "hello123"
  )}
  
  describe "POST /create" do
    context "with valid credentials" do
      it "redirects the user" do
        post '/sessions', 
          params: { session: { username: user.username, password: user.password } }
        expect(response).to redirect_to user_path(user)
        follow_redirect!
        expect(response.body).to include("#{user.username} successfully signed in")
      end
    end

    context "with invalid credentials" do
      it "does not redirect the user" do
        post '/sessions', 
          params: { session: { username: user.username, password: "nottherightpassword" } }
        expect(response).to_not redirect_to user_path(user)
        follow_redirect!
        expect(response.body).to include("Log In")
      end
    end
  end
end
